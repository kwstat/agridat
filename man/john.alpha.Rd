\name{john.alpha}
\alias{john.alpha}
\docType{data}
\title{
  Alpha lattice design of spring oats
}
\description{
  Alpha lattice design of spring oats
}

\format{
  A data frame with 72 observations on the following 5 variables.
  \describe{
    \item{\code{plot}}{plot number}
    \item{\code{rep}}{replicate}
    \item{\code{block}}{incomplete block}
    \item{\code{gen}}{genotype (variety)}
    \item{\code{yield}}{dry matter yield (tonnes/ha)}
  }
}

\details{
  
  A spring oats trial grown in Craibstone, near Aberdeen.
  There were 24 varieties in 3 replicates, each consisting
  of 6 incomplete blocks of 4 plots.  Planted in a resolvable
  alpha design.  The plots were laid out in a single line.
  
}

\source{  
  J. A. John & E. R. Williams (1995).
  \emph{Cyclic and computer generated designs},
  Chapman and Hall, London.  Page 146.
}

\references{
  Piepho, H.P. and Mohring, J. (2007),
  Computing heritability and selection response from unbalanced
  plant breeding trials,
  \emph{Genetics}, 177, 1881-1888.
  http://doi.org/10.1534/genetics.107.074229
}

\examples{

data(john.alpha)
dat <- john.alpha

# RCB (no incomplete block)
m0 <- lm(yield ~ 0 + gen + rep, data=dat)

# Block fixed (intra-block analysis) (bottom of table 7.4 in John)
m1 <- lm(yield ~ 0 + gen + rep + rep:block, dat)
anova(m1)

# Block random (combined inter-intra block analysis)
if(require(lme4) & require(lucid)){
m2 <- lmer(yield ~ 0 + gen + rep + (1|rep:block), dat)

anova(m2)
## Analysis of Variance Table
##     Df Sum Sq Mean Sq  F value
## gen 24 380.43 15.8513 185.9942
## rep  2   1.57  0.7851   9.2123
vc(m2)
##        grp        var1 var2    vcov  sdcor
##  rep:block (Intercept) <NA> 0.06194 0.2489
##   Residual        <NA> <NA> 0.08523 0.2919


# Variety means.  John and Williams table 7.5.  Slight, constant
# difference for each method as compared to John and Williams.
means <- data.frame(rcb=coef(m0)[1:24],
                    ib=coef(m1)[1:24],
                    intra=fixef(m2)[1:24])
head(means)
##             rcb       ib    intra
## genG01 5.201233 5.268742 5.146433
## genG02 4.552933 4.665389 4.517265
## genG03 3.381800 3.803790 3.537934
## genG04 4.439400 4.728175 4.528828
## genG05 5.103100 5.225708 5.075944
## genG06 4.749067 4.618234 4.575394

require(lattice)
splom(means, main="john.alpha - means for RCB, IB, Intra-block")

}

# ----------------------------------------------------------------------------

\dontrun{
  # asreml3
  # Heritability calculation of Piepho & Mohring, Example 1
  require(asreml)
  m3 <- asreml(yield ~ 1 + rep, data=dat, random=~ gen + rep:block)
  sg2 <- summary(m3)$varcomp['gen!gen.var','component'] # .142902

  # Average variance of a difference of two adjusted means (BLUP)
  
  p3 <- predict(m3, data=dat, classify="gen", sed=TRUE)
  # Matrix of pair-wise SED values, squared
  vdiff <- p3$predictions$sed^2
  # Average variance of two DIFFERENT means (using lower triangular of vdiff)
  vblup <- mean(vdiff[lower.tri(vdiff)]) # .05455038
  
  # Note that without sed=TRUE, asreml reports square root of the average variance
  # of a difference between the variety means, so the following gives the same value
  # predict(m3, data=dat, classify="gen")$pred$avsed ^ 2 # .05455038

  # Average variance of a difference of two adjusted means (BLUE)
  m4 <- asreml(yield ~ 1 + gen + rep, data=dat, random = ~ rep:block)
  p4 <- predict(m4, data=dat, classify="gen", sed=TRUE)
  vdiff <- p4$predictions$sed^2
  vblue <- mean(vdiff[lower.tri(vdiff)]) # .07010875
  # Again, could use predict(m4, data=dat, classify="gen")$pred$avsed ^ 2
  
  # H^2 Ad-hoc measure of heritability
  sg2 / (sg2 + vblue/2) # .803
  
  # H^2c Similar measure proposed by Cullis.
  1-(vblup / 2 / sg2) # .809
}

# ----------------------------------------------------------------------------

\dontrun{
  ## # Heritability calculation of Piepho & Mohring, Example 1
  ## require(asreml4)
  ## m3 <- asreml(yield ~ 1 + rep, data=dat, random=~ gen + rep:block)
  ## sg2 <- summary(m3)$varcomp['gen','component'] # .142902

  ## # Average variance of a difference of two adjusted means (BLUP)
  
  ## p3 <- predict(m3, data=dat, classify="gen", sed=TRUE)
  ## # Matrix of pair-wise SED values, squared
  ## vdiff <- p3$sed^2
  ## # Average variance of two DIFFERENT means (using lower triangular of vdiff)
  ## vblup <- mean(vdiff[lower.tri(vdiff)]) # .05455038
  
  ## # Note that without sed=TRUE, asreml reports square root of the average variance
  ## # of a difference between the variety means, so the following gives the same value
  ## # predict(m3, data=dat, classify="gen")$pred$avsed ^ 2 # .05455038

  ## # Average variance of a difference of two adjusted means (BLUE)
  ## m4 <- asreml(yield ~ 1 + gen + rep, data=dat, random = ~ rep:block)
  ## p4 <- predict(m4, data=dat, classify="gen", sed=TRUE)
  ## vdiff <- p4$sed^2
  ## vblue <- mean(vdiff[lower.tri(vdiff)]) # .07010875
  ## # Again, could use predict(m4, data=dat, classify="gen")$pred$avsed ^ 2
  
  ## # H^2 Ad-hoc measure of heritability
  ## sg2 / (sg2 + vblue/2) # .803
  
  ## # H^2c Similar measure proposed by Cullis.
  ## 1-(vblup / 2 / sg2) # .809
}

# ----------------------------------------------------------------------------

\dontrun{

  # Illustrate how to do the same calculations with lme4
  # http://stackoverflow.com/questions/38697477
  
 require(lme4)
  
  cov2sed <- function(x){
    # Convert var-cov matrix to SED matrix
    # sed[i,j] = sqrt( x[i,i] + x[j,j]- 2*x[i,j] )
    n <- nrow(x)
    vars <- diag(x)
    sed <- sqrt( matrix(vars, n, n, byrow=TRUE) +
                   matrix(vars, n, n, byrow=FALSE) - 2*x )
    diag(sed) <- 0
    return(sed)
  }

  # Same as asreml model m4. Note 'gen' must be first term
  m5blue <- lmer(yield ~ 0 + gen + rep + (1|rep:block), dat)
  
  require(lsmeans)
  ls5blue <- lsmeans(m5blue, "gen")
  con <- ls5blue@linfct[,1:24] # contrast matrix for genotypes
  # The 'con' matrix is identity diagonal, so we don't need to multiply,
  # but do so for a generic approach
  # sed5blue <- cov2sed(con %*% vcov(m5blue)[1:24,1:24] %*% t(con))
  tmp <- tcrossprod( crossprod(t(con), vcov(m5blue)[1:24,1:24]), con)
  sed5blue <- cov2sed(tmp)

  
  # vblue Average variance of difference between genotypes
  vblue <- mean(sed5blue[upper.tri(sed5blue)]^2) # .07010875 matches 'vblue' from asreml

  # Now blups
  m5blup <- lmer(yield ~ 0 + (1|gen) + rep + (1|rep:block), dat)
  re5 <- ranef(m5blup,condVar=TRUE)
  vv1 <- attr(re5$gen,"postVar")  
  vblup <- 2*mean(vv1) # .0577 not exactly same as 'vblup' above
  
  # H^2 Ad-hoc measure of heritability
  sg2 <- c(lme4::VarCorr(m5blup)[["gen"]])  # 0.142902
  sg2 / (sg2 + vblue/2) # .803 matches asreml

  # H^2c Similar measure proposed by Cullis.
  1-(vblup / 2 / sg2) # .809 from asreml, .800 from lme4
}

# ----------------------------------------------------------------------------

}
\keyword{datasets}
