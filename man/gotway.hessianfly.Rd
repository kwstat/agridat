\name{gotway.hessianfly}
\alias{gotway.hessianfly}
\docType{data}
\title{
  Hessian fly damage to wheat varities
}
\description{
  Hessian fly damage to wheat varities
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

  http://doi.org/10.2307/1400401
}
\references{
  The GLIMMIX procedure. http://www.ats.ucla.edu/stat/SAS/glimmix.pdf
}
\examples{

## FIXME Could the spaMM package be useful here...????

data(gotway.hessianfly)
dat <- gotway.hessianfly

dat$prop <- dat$y / dat$n
if(require(desplot)){
  desplot(prop~long*lat, dat,
          aspect=1, # true aspect
          out1=block, text=gen, cex=1, shorten='no',
          main="gotway.hessianfly")
}

# ----------------------------------------------------------------------------

# Block random.  See Glimmix manual, output 1.18.
# Note: (Different parameterization)
if(require(lme4)){
## l2 <- glmer(cbind(y, n-y) ~ gen + (1|block), data=dat, family=binomial,
##    control=glmerControl(check.nlev.gtr.1="ignore"))
## coef(l2)
}

# ----------------------------------------------------------------------------

\dontrun{
  # asreml3
  require(asreml)
  a2 <- asreml(prop ~ gen, data=dat, random=~block,
               family=asreml.binomial(),
               weights=n)
  coef(a2)
}

# ----------------------------------------------------------------------------

\dontrun{
  ## require(asreml4)
  ## a2 <- asreml(prop ~ gen, data=dat, random=~block,
  ##              family=asr_binomial(),
  ##              weights=n)
  ## coef(a2)
}

}
\keyword{datasets}
