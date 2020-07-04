\name{strickland.grape.uniformity}
\alias{strickland.grape.uniformity}
\docType{data}
\title{
  Uniformity trial of grape
}
\description{
  Uniformity trial of grape in Australia
}
\usage{data("strickland.grape.uniformity")}
\format{
  A data frame with 155 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield per vine, pounds}
  }
}
\details{
  Yields of individual grape vines, planted 8 feet apart in rows 10 feet
  apart.
  Grown in Rutherglen, North-East Victoria, Australiaj, 1930.

  Certain sections were omitted because of missing vines.
}
\source{
  A. G. Strickland (1932).
  A vine uniformity trial.
  Journal of Agriculture, Victoria, 30, 584-593.
  http://handle.slv.vic.gov.au/10381/386462
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)

data(strickland.grape.uniformity)
dat <- strickland.grape.uniformity

  libs(desplot)
  desplot(dat, yield ~ col*row,
          main="strickland.grape.uniformity",
          flip=TRUE, aspect=(31*8)/(5*10) )
  
  # CV 43.4%
  sd(dat$yield, na.rm=TRUE)/mean(dat$yield, na.rm=TRUE)
  
  # anova like Strickland, appendix 1
  anova(aov(yield ~ factor(row) + factor(col), data=dat))

  # numbers ending in .5 much more common than .0
  # table(substring(format(na.omit(dat$yield)),4,4))
  #  0   5 
  # 25 100 

}
}
\keyword{datasets}
