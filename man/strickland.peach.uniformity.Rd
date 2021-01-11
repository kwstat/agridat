\name{strickland.peach.uniformity}
\alias{strickland.peach.uniformity}
\docType{data}
\title{
  Uniformity trial of peach
}
\description{
  Uniformity trial of peach trees in Australia.
}
\usage{data("strickland.peach.uniformity")}
\format{
  A data frame with 144 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, pounds per tree}
  }
}
\details{
    Yields are the weight of peaches per individual tree in pounds.
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

  data(strickland.peach.uniformity)
  dat <- strickland.peach.uniformity

  mean(dat$yield) # 131.3, Strickland has 131.3
  sd(dat$yield)/mean(dat$yield) # 31.1, Strickland has 34.4

  libs(desplot)
  desplot(dat, yield ~ col*row,
          main="strickland.peach.uniformity",
          flip=TRUE, aspect=1)
}
}
\keyword{datasets}
