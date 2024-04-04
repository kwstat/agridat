\name{coombs.rice.uniformity}
\alias{coombs.rice.uniformity}
\docType{data}
\title{
  Uniformity trial of rice in Malaysia
}
\description{
  Uniformity trial of rice in Malaysia
}
\usage{data("coombs.rice.uniformity")}
\format{
  A data frame with 54 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield in gantangs per plot}
  }
}
\details{
  Estimated harvest date is 1915 or earlier.
  
  Field length, 18 plots * 1/2 chain.
  
  Field width, 3 plots * 1/2 chain.
}
\source{
  Coombs, G. E. and J. Grantham (1916).
  Field Experiments and the Interpretation of their results.
  The Agriculture Bulletin of the Federated Malay States, No 7.
  https://www.google.com/books/edition/The_Agricultural_Bulletin_of_the_Federat/M2E4AQAAMAAJ
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(coombs.rice.uniformity)
  dat <- coombs.rice.uniformity

  # Data check. Matches Coombs 709.4
  # sum(dat$yield)

  # There are an excess number of 12s and 14s in the yield
  libs(lattice)
  qqmath( ~ yield, dat) # weird
  
  libs(desplot)
  desplot(dat, yield ~ col*row,
          main="coombs.rice.uniformity",
          flip=TRUE, aspect=(18 / 3))
}
}
\keyword{datasets}
