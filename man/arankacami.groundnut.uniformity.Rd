\name{arankacami.groundnut.uniformity}
\alias{arankacami.groundnut.uniformity}
\docType{data}
\title{
  Uniformity trial of groundnut
}
\description{
  Uniformity trial of groundnut
}
\usage{data("arankacami.groundnut.uniformity")}
\format{
  A data frame with 96 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, kg/plot}
  }
}
\details{
  Basic plot size is 0.75 m (rows) x  4 m (columns).
}
\source{
  Ira Arankacami, R. Rangaswamy. (1995).
  A Text Book of Agricultural Statistics. New Age International Publishers.
  Table 19.1.
}
\references{
  None
}
\examples{
\dontrun{
library(agridat)
data(arankacami.groundnut.uniformity)
dat <- arankacami.groundnut.uniformity

require(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, aspect=(12*.75)/(8*1),
        main="arankacami.groundnut.uniformity")

}
}
\keyword{datasets}
