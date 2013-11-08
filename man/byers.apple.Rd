\name{byers.apple}
\alias{byers.apple}
\docType{data}
\title{
  Diameters of apples
}
\description{
  Measurements of the diameters of apples
}

\format{
  A data frame with 480 observations on the following 6 variables.
  \describe{
    \item{\code{tree}}{tree factor, 10 levels}
    \item{\code{apple}}{apple factor, 24 levels}
    \item{\code{size}}{size of apple}
    \item{\code{appleid}}{unique id number for each apple}
    \item{\code{time}}{time period, 1-6 = (week/2)}
    \item{\code{diameter}}{diameter, inches}
  }
}
\details{
  Experiment conducted at the Winchester Agricultural Experiment Station
  of Virginia Polytechnic Institute and State University.   Twentyfive
  apples were chosen from each of ten apple trees.

  Of these, there were 80 apples in the largest size class, 2.75 inches
  in diameter or greater.

  The diameters of the apples were recorded every two weeks over a
  12-week period.
}
\source{
  Schabenberger, Oliver and Francis J. Pierce. 2002.
  \emph{Contemporary Statistical Models for the Plant and Soil
    Sciences}. CRC Press, Boca Raton, FL.
}
\examples{
dat <- byers.apple

library(lattice)
xyplot(diameter ~ time | factor(appleid), data=dat, type=c('p','l'),
       main="byers.apple")

# Overall fixed linear trend, plus random intercept/slope deviations
# for each apple.  Observations within each apple are correlated.
library(nlme)
m1 <- lme(diameter ~ 1 + time, data=dat,
          random = ~ time|appleid, method='ML',
          cor = corAR1(0, form=~ time|appleid),
          na.action=na.omit)
VarCorr(m1)
## appleid = pdLogChol(time)
##             Variance     StdDev     Corr
## (Intercept) 7.353789e-03 0.08575423 (Intr)
## time        3.632377e-05 0.00602692 0.83
## Residual    4.555256e-04 0.02134305
}
\keyword{datasets}
