\name{burgueno.alpha}
\alias{burgueno.alpha}
\docType{data}
\title{
  Incomplete block alpha design
}
\description{
  Incomplete block alpha design
}
\usage{data("burgueno.alpha")}

\format{
  A data frame with 48 observations on the following 6 variables.
  \describe{
    \item{\code{rep}}{rep factor, 3 levels}
    \item{\code{block}}{block factor, 12 levels}
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{gen}}{genotype factor, 16 levels}
    \item{\code{yield}}{yield, numeric}
  }
}
\details{
  A field experiment with 3 reps, 4 blocks per rep, laid out as an alpha
  design.
}

\source{
  J Burgueno, A Cadena, J Crossa, M Banziger, A Gilmour, B Cullis. 2000.
  \emph{User's guide for spatial analysis of field variety trials using
    ASREML}.  CIMMYT.

  Electronic version of the data obtained from CropStat software.

  Used with permission of Juan Burgueno.
}

\examples{

data(burgueno.alpha)
dat <- burgueno.alpha

if(require(desplot)){
  desplot(yield~col*row, dat,
          main='burgueno.alpha', out1=rep, out2=block,
          text=gen, cex=1,shorten="none")
}


if(require(lme4) && require(lucid)){
  # Inc block model
  m1 <- lmer(yield ~ gen + (1|rep/block), data=dat)
  vc(m1) # Matches Burgueno p. 26
  ##        grp        var1 var2   vcov sdcor
  ##  block:rep (Intercept) <NA>  86900 294.8
  ##        rep (Intercept) <NA> 200900 448.2
  ##   Residual        <NA> <NA> 133200 365
  
}

\dontrun{
  require(asreml)
  # Inc block model
  m2 <- asreml(yield ~ gen, data=dat, random = ~ rep/block)
  m2$loglik # Matches Burgueno p. 26
  m2$coef$fixed # Matches solution on p. 27

  # AR1 x AR1 model plus linear row effect, random spline row
  dat <- transform(dat, xf=factor(col), yf=factor(row))
  dat <- dat[order(dat$xf,dat$yf),]
  m3 <- asreml(yield ~ gen + lin(yf), data=dat, random = ~ spl(yf),
               rcov= ~ar1(xf):ar1(yf))
  m3$loglik # Matches row 8 of Table 1
  plot(variogram(m3), main="burgueno.alpha") # Figure 1
}

}

\keyword{datasets}
