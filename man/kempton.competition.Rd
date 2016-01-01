\name{kempton.competition}
\alias{kempton.competition}
\docType{data}
\title{
  Sugar beet trial with competition effects
}
\description{
  Yield of sugar beets for 36 varieties in a 3-rep RCB experiment.
  Competition effects are present.
}

\format{
  A data frame with 108 observations on the following 5 variables.
  \describe{
    \item{\code{gen}}{Genotype factor, 36 levels}
    \item{\code{rep}}{Rep factor, 3 levels}
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
    \item{\code{yield}}{Yield in kg/plot}
  }
}
\details{
  Entries are grown in 12m rows, 0.5m apart.  Guard rows were grown
  alongside replicate boundaries, but yields of these plots are not
  included.
}
\source{
  R Kempton, 1982.
  Adjustment for competition between varieties in plant breeding trials,
  \emph{Journal of Agricultural Science}, 98, 599-611.
  \url{http://doi.org/10.1017/S0021859600054381}
}

\examples{

data(kempton.competition)
dat <- kempton.competition

# Raw means in Kempton table 2
round(tapply(dat$yield, dat$gen, mean),2)

# Fixed genotype effects, random rep effects,
# Autocorrelation of neighboring plots within the same rep, phi = -0.22
require("nlme")
m1 <- lme(yield ~ -1+gen, random=~1|rep, data=dat,
          corr=corAR1(form=~col|rep))
# Lag 1 autocorrelation is negative--evidence of competition
plot(ACF(m1), alpha=.05, grid=TRUE, main="kempton.competition",
     ylab="Autocorrelation between neighborning plots")

# Genotype effects
round(fixef(m1),2)

# Variance of yield increases with yield
plot(m1, main="kempton.competition")

}

