\name{besag.met}
\alias{besag.met}
\docType{data}
\title{
  Multi-environment trial of corn laid out in incomplete-blocks
}
\description{
  Multi-environment trial of corn laid out in incomplete-blocks at each location.
}

\format{
  A data frame with 1152 observations on the following 7 variables.
  \describe{
    \item{\code{county}}{county}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{rep}}{rep}
    \item{\code{block}}{incomplete block}
    \item{\code{yield}}{yield}
    \item{\code{gen}}{genotype, 1-64}
  }
}
\details{

  Multi-environment trial of 64 corn hybrids in six counties in North
  Carolina.  Each location had 3 replicates in in incomplete-block
  design with an 18x11 lattice of plots whose length-to-width ratio was
  about 2:1.

  Note: In the original data, each county had 6 missing plots.  This
  data has rows for each missing plot that uses the same
  county/block/rep to fill-out the row, sets the genotype to G01, and
  sets the yield to missing.  These missing values were added to the
  data so that asreml could more easily do AR1xAR1 analysis using
  rectangular regions.

  Each location/panel is:
  
  Field length: 18 rows * 2 units = 36 units.

  Field width: 11 plots * 1 unit = 11 units.
  
}
\source{
  Julian Besag and D Higdon, 1999.
  Bayesian Analysis of Agricultural Field Experiments,
  \emph{Journal of the Royal Statistical Society: Series B (Statistical
    Methodology)}, 61, 691--746. Table 1.

  http://doi.org/10.1111/1467-9868.00201

  Retrieved from
  http://web.archive.org/web/19990505223413/www.stat.duke.edu/~higdon/trials/nc.dat

  Used with permission of David Higdon.
}

\examples{

data(besag.met)
dat <- besag.met

if(require(desplot)){
  desplot(yield ~ col*row|county, dat,
          aspect=36/11, # true aspect
          out1=rep, out2=block,
          main="besag.met")
}

# Average reps
datm <- aggregate(yield ~ county + gen, data=dat, FUN=mean)

# Sections below fit heteroskedastic variance models (variance for each variety)
# asreml takes 1 second, lme 73 seconds, SAS PROC MIXED 30 minutes

# ----------------------------------------------------------------------------

\dontrun{
  # lme
  require(nlme)
  m1l <- lme(yield ~ -1 + gen, data=datm, random=~1|county,
             weights = varIdent(form=~ 1|gen))
  m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = FALSE))^2
  ##           G02    G03    G04    G05    G06    G07    G08
  ##  91.90 210.75  63.03 112.05  28.39 237.36  72.72  42.97
  ## ... etc ...
}

# ----------------------------------------------------------------------------

\dontrun{
  # asreml3
  require(asreml)
  
  # asreml Using 'rcov' ALWAYS requires sorting the data

  datm <- datm[order(datm$gen),]
  m1a <- asreml(yield ~ gen, data=datm,
                random = ~ county,
                rcov = ~ at(gen):units,
                predict=asreml:::predict.asreml(classify="gen"))

  require(lucid)
  vc(m1a)[1:7,]
  ##             effect component std.error z.ratio constr
  ##  county!county.var   1324       838.2      1.6    pos
  ##   gen_G01!variance     91.93     58.82     1.6    pos
  ##   gen_G02!variance    210.7     133.9      1.6    pos
  ##   gen_G03!variance     63.03     40.53     1.6    pos
  ##   gen_G04!variance    112.1      71.53     1.6    pos
  ##   gen_G05!variance     28.39     18.63     1.5    pos
  ##   gen_G06!variance    237.4     150.8      1.6    pos


  # We get the same results from asreml & lme
  plot(m1a$gammas[-1],
       m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = FALSE))^2)


  # The following example shows how to construct a GxE biplot
  # from the FA2 model.

  dat <- besag.met
  dat <- transform(dat, xf=factor(col), yf=factor(row))
  dat <- dat[order(dat$county, dat$xf, dat$yf), ]
  
  # First, AR1xAR1
  m1 <- asreml(yield ~ county, data=dat,
               random = ~ gen:county,
               rcov = ~ at(county):ar1(xf):ar1(yf))
  # Add FA1
  m2 <- update(m1, random=~gen:fa(county,1))
  # FA2
  m3 <- update(m2, random=~gen:fa(county,2))
  
  # Use the loadings to make a biplot
  vars <- vc(m3)
  psi <- vars[grepl(".var$", vars$effect), "component"]
  la1 <- vars[grepl(".fa1$", vars$effect), "component"]
  la2 <- vars[grepl(".fa2$", vars$effect), "component"]
  mat <- as.matrix(data.frame(psi, la1, la2))
  rot <- svd(mat[,-1])$v # rotation matrix
  lam <- mat[,-1] %*% rot # Rotate the loadings
  colnames(lam) <- c("load1", "load2")
  
  co3 <- coef(m3)$random # Scores are the GxE coefficients
  ix1 <- grepl("_Comp1$", rownames(co3))
  ix2 <- grepl("_Comp2$", rownames(co3))
  sco <- matrix(c(co3[ix1], co3[ix2]), ncol=2, byrow=FALSE)
  sco <- sco %*% rot # Rotate the scores
  dimnames(sco) <- list(levels(dat$gen) , c('load1','load2'))
  rownames(lam) <- levels(dat$county)
  sco[,1] <- -1 * sco[,1]
  lam[,1] <- -1 * lam[,1]
  biplot(sco, lam, cex=.5, main="FA2 coefficient biplot")
  # G variance matrix
  gvar <- lam %*% t(lam) + diag(mat[,1])
  
  # Now get predictions and make an ordinary biplot
  p3 <- predict(m3, data=dat, classify="county:gen")
  p3 <- p3$pred$pval
  require("gge")  
  bi3 <- gge(predicted.value ~ gen*county, data=p3, scale=FALSE)
  dev.new()
  # Very similar to the coefficient biplot
  biplot(bi3, stand=FALSE, # what does 'stand' do?
         main="SVD biplot of FA2 predictions")

}

# ----------------------------------------------------------------------------

\dontrun{
 ##  require(asreml4)
  
 ##  # asreml Using 'rcov' ALWAYS requires sorting the data
 ##  datm <- datm[order(datm$gen),]

 ##  m1 <- asreml(yield ~ gen, data=datm,
 ##               random = ~ county,
 ##               resid = ~ dsum( ~ units|gen))
 ##  #summary(m1)$varcomp[1:7,]
 ##  require(lucid)
 ##  vc(m1)[1:7,]
 ## ##     effect component std.error z.ratio bound %ch
 ## ##     county   1324       838.2      1.6     P 0  
 ## ## gen_G01(R)     91.95     58.85     1.6     P 0  
 ## ## gen_G02(R)    210.7     133.8      1.6     P 0.1
 ## ## gen_G03(R)     63.04     40.55     1.6     P 0  
 ## ## gen_G04(R)    112.1      71.54     1.6     P 0  
 ## ## gen_G05(R)     28.38     18.61     1.5     P 0.1
 ## ## gen_G06(R)    237.4     150.8      1.6     P 0  
  
 ##  # We get the same results from asreml & lme
 ##  plot(m1$vparameters[-1],
 ##     m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = FALSE))^2)

 ##  # The following example shows how to construct a GxE biplot
 ##  # from the FA2 model.

 ##  dat <- besag.met
 ##  dat <- transform(dat, xf=factor(col), yf=factor(row))
 ##  dat <- dat[order(dat$county, dat$xf, dat$yf), ]

 ##  # First, AR1xAR1
 ##  m1 <- asreml(yield ~ county, data=dat,
 ##               random = ~ gen:county,
 ##               resid = ~ dsum( ~ ar1(xf):ar1(yf)|county))

 ##  # Add FA1
 ##  m2 <- update(m1, random=~gen:fa(county,1))
 ##  # FA2
 ##  m3 <- update(m2, random=~gen:fa(county,2))

 ##  # Use the loadings to make a biplot
 ##  vars <- vc(m3)
 ##  psi <- vars[grepl("!var$", vars$effect), "component"]
 ##  la1 <- vars[grepl("!fa1$", vars$effect), "component"]
 ##  la2 <- vars[grepl("!fa2$", vars$effect), "component"]
 ##  mat <- as.matrix(data.frame(psi, la1, la2))
 ##  rot <- svd(mat[,-1])$v # rotation matrix
 ##  lam <- mat[,-1] %*% rot # Rotate the loadings
 ##  colnames(lam) <- c("load1", "load2")

 ##  co3 <- coef(m3)$random # Scores are the GxE coefficients
 ##  ix1 <- grepl("_Comp1$", rownames(co3))
 ##  ix2 <- grepl("_Comp2$", rownames(co3))
 ##  sco <- matrix(c(co3[ix1], co3[ix2]), ncol=2, byrow=FALSE)
 ##  sco <- sco %*% rot # Rotate the scores
 ##  dimnames(sco) <- list(levels(dat$gen) , c('load1','load2'))
 ##  rownames(lam) <- levels(dat$county)
 ##  sco[,1] <- -1 * sco[,1]
 ##  lam[,1] <- -1 * lam[,1]
 ##  biplot(sco, lam, cex=.5, main="FA2 coefficient biplot")
 ##  # G variance matrix
 ##  gvar <- lam %*% t(lam) + diag(mat[,1])
  
 ##  # Now get predictions and make an ordinary biplot
 ##  p3 <- predict(m3, data=dat, classify="county:gen")
 ##  p3 <- p3$pvals
 ##  require("gge")  
 ##  bi3 <- gge(predicted.value ~ gen*county, data=p3, scale=FALSE)
 ##  dev.new()
 ##  # Very similar to the coefficient biplot
 ##  biplot(bi3, stand=FALSE, main="SVD biplot of FA2 predictions")

}

}

