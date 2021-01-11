\name{gotway.hessianfly}
\alias{gotway.hessianfly}
\docType{data}
\title{
  Hessian fly damage to wheat varieties
}
\description{
  Hessian fly damage to wheat varieties
}

\format{
  \describe{
    \item{\code{block}}{block factor, 4 levels}
    \item{\code{genotype factor, 16 wheat varieties}}{}
    \item{\code{lat}}{latitude, numeric}
    \item{\code{long}}{longitude, numeric}
    \item{\code{y}}{number of damaged plants}
    \item{\code{n}}{number of total plants}
  }
}
\details{
  The response is binomial.

  Each plot was square.

}
\source{
  C. A. Gotway and W. W. Stroup.
  A Generalized Linear Model Approach to Spatial Data Analysis and Prediction
  \emph{Journal of Agricultural, Biological, and Environmental
    Statistics}, 2, 157-178.

  https://doi.org/10.2307/1400401
}
\references{
  The GLIMMIX procedure. https://www.ats.ucla.edu/stat/SAS/glimmix.pdf
}
\examples{
\dontrun{

  library(agridat)
  data(gotway.hessianfly)
  dat <- gotway.hessianfly
  
  dat$prop <- dat$y / dat$n
  
  libs(desplot)
  desplot(dat, prop~long*lat,
          aspect=1, # true aspect
          out1=block, num=gen, cex=.75,
          main="gotway.hessianfly")
  

  # ----------------------------------------------------------------------------

  # spaMM package example
  libs(spaMM)
  m1 = HLCor(cbind(y, n-y) ~ 1 + gen + (1|block) + Matern(1|long+lat),
             data=dat, family=binomial(), ranPars=list(nu=0.5, rho=1/.7))
  summary(m1)
  fixef(m1)
  # The following line fails with "Invalid graphics state"
  # when trying to use pkgdown::build_site
  # filled.mapMM(m1)

  # ----------------------------------------------------------------------------

  # Block random.  See Glimmix manual, output 1.18.
  # Note: (Different parameterization)
  
  libs(lme4)
  l2 <- glmer(cbind(y, n-y) ~ gen + (1|block), data=dat, family=binomial,
    control=glmerControl(check.nlev.gtr.1="ignore"))
  coef(l2)

}
}
\keyword{datasets}
