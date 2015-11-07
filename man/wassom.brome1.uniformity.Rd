\name{wassom.brome1.uniformity}
\alias{wassom.brome1.uniformity}
\alias{wassom.brome2.uniformity}
\alias{wassom.brome3.uniformity}
\docType{data}
\title{
  Uniformity trials of bromegrass.
}
\description{
  Uniformity trials of bromegrass.
}
\usage{data(wassom.brome1.uniformity)}
\format{
  A data frame with 1296 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, pounds}
  }
}
\details{

  Experiments were conducted at Ames, Iowa.  The response variable is
  forage yield in pounds of green weight.   Each plot was 3.5 x 4 feet.

  There are three datasets, hereafter referred to as 'brome1', 'brome2',
  'brome3'.

  Brome1 was broadcast seeded, harvested in 1950.

  Brome2 was row planted, harvested in 1950.

  Brome3 was broadcast seeded, harvested in 1951.  This field contained
  a mixture of alfalfa and brome in about equal proportions.

  Wassom and Kalton used two different methods to estimate optimum plot
  size.  1. Relative efficiency of different plot sizes. 2. Regression
  of the log variance of yield vs log plot size.
}
\source{
  Wassom and R.R. Kalton. (1953).
  Estimations of Optimum Plot Size Using Data from Bromegrass Uniformity
  Trials. Agricultural Experiment Station, Iowa State College, Bulletin 396.
  \url{http://lib.dr.iastate.edu/ag_researchbulletins/32/}.
}

\examples{

data(wassom.brome1.uniformity)
dat <- wassom.brome1.uniformity

require("agrifun")
desplot(yield~col*row, dat, main="wassom.brome1.uniformity", flip=TRUE)

data(wassom.brome2.uniformity)
dat <- wassom.brome2.uniformity
desplot(yield~col*row, dat, main="wassom.brome2.uniformity", flip=TRUE)

data(wassom.brome3.uniformity)
dat <- wassom.brome3.uniformity
desplot(yield~col*row, dat, main="wassom.brome3.uniformity", flip=TRUE)

}
\keyword{datasets}
