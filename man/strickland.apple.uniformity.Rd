\name{strickland.apple.uniformity}
\alias{strickland.apple.uniformity}
\docType{data}
\title{
  Uniformity trial in apple
}
\description{
  Uniformity trial in apple in Australia
}
\usage{data("strickland.apple.uniformity")}
\format{
  A data frame with 198 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield per tree, pounds}
  }
}
\details{
  Some recently re-worked trees were removed from the data.

  The distance between trees in uncertain, but likely in the range 20-30
  feet.
  
}
\source{
  A. G. Strickland (1935).
  Error in horticultural experiments.
  Journal of Agriculture, Victoria, 33, 408-416.
  https://handle.slv.vic.gov.au/10381/386642
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
  data(strickland.apple.uniformity)
  dat <- strickland.apple.uniformity
  libs(desplot)
  desplot(dat, yield ~ col*row,
          main="strickland.apple.uniformity",
          flip=TRUE, aspect=(18/11))
}
}
\keyword{datasets}
