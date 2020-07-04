\name{strickland.tomato.uniformity}
\alias{strickland.tomato.uniformity}
\docType{data}
\title{
  Uniformity trial of tomato
}
\description{
  Uniformity trial of tomato in Australia
}
\usage{data("strickland.tomato.uniformity")}
\format{
  A data frame with 180 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield per plot, pounds}
  }
}
\details{
  Tomato plants were placed 2 feet apart in rows 4 feet apart. Each plot
  contained 6 plants.

  Field dimensions are not given, but the most likely design is:

  Field length: 6 plots * 6 plants * 2 feet = 72 feet

  Field width: 30 plots * 4 feet = 120 feet
}
\source{
  A. G. Strickland (1935).
  Error in horticultural experiments.
  Journal of Agriculture, Victoria, 33, 408-416.
  http://handle.slv.vic.gov.au/10381/386642
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
  data(strickland.tomato.uniformity)
  dat <- strickland.tomato.uniformity

  mean(dat$yield)
  sd(dat$yield)

  libs(desplot)
  desplot(dat, yield ~ col*row,
          main="strickland.tomato.uniformity",
          flip=TRUE, aspect=(6*12)/(30*4))
}
}
\keyword{datasets}
