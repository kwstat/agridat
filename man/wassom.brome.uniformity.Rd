\name{wassom.brome.uniformity}
\alias{wassom.brome1.uniformity}
\alias{wassom.brome2.uniformity}
\alias{wassom.brome3.uniformity}
\docType{data}
\title{
  Uniformity trials of bromegrass.
}
\description{
  Uniformity trials of bromegrass at Ames, Iowa, 1950-1951.
}
\usage{data(wassom.brome1.uniformity)}
\format{
  A data frame with 1296 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{forage yield, pounds}
  }
}
\details{

  Experiments were conducted at Ames, Iowa.  The response variable is
  forage yield in pounds of green weight.
  Optimum plot size was estimated to be about 3.5 x 7.5 feet.

  Wassom and Kalton used two different methods to estimate optimum plot
  size.
  1. Relative efficiency of different plot sizes.
  2. Regression of the log variance of yield vs log plot size.

  There are three datasets, hereafter referred to as 'brome1', 'brome2',
  'brome3'.

  Brome1 was broadcast seeded, harvested in 1950. 

  Brome2 was row planted, harvested in 1950.

  Brome3 was broadcast seeded, harvested in 1951.  This field contained
  a mixture of alfalfa and brome in about equal proportions.

  Each plot was 3.5 ft x 4 ft, but the orientation of the plot is not
  clear.
  
  Field width: 36 plots

  Field height: 36 plots
}
\source{
  Wassom and R.R. Kalton. (1953).
  Estimations of Optimum Plot Size Using Data from Bromegrass Uniformity
  Trials. Agricultural Experiment Station, Iowa State College, Bulletin 396.
  \url{http://lib.dr.iastate.edu/ag_researchbulletins/32/}.
}

\examples{

data(wassom.brome1.uniformity)
dat1 <- wassom.brome1.uniformity
if(require(desplot)){
  desplot(yield~col*row, dat1,
          flip=TRUE,
          main="wassom.brome1.uniformity")
}

data(wassom.brome2.uniformity)
dat2 <- wassom.brome2.uniformity
if(require(desplot)){
  desplot(yield~col*row, dat2,
          flip=TRUE, 
          main="wassom.brome2.uniformity")
}

data(wassom.brome3.uniformity)
dat3 <- wassom.brome3.uniformity
if(require(desplot)){
  desplot(yield~col*row, dat3,
          flip=TRUE,
          main="wassom.brome3.uniformity")
}

}
\keyword{datasets}
