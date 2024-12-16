\name{rangaswamy.groundnut.uniformity}
\alias{rangaswamy.groundnut.uniformity}
\docType{data}
\title{
  Uniformity trial of groundnut
}
\description{
  Uniformity trial of groundnut
}
\usage{data("rangaswamy.groundnut.uniformity")}
\format{
  A data frame with 96 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, kg/plot}
  }
}
\details{
  The year of the experiment is unknown, but before 1995.
  
  Field width: 8 plots x 4 m = 32 m

  Field length: 12 plots x .75 m = 8 m
  
}
\source{
  R. Rangaswamy. (1995).
  A Text Book of Agricultural Statistics.
  New Age International Publishers.
  Table 19.1. Page 237.
  https://www.google.com/books/edition/A_Text_Book_of_Agricultural_Statistics/QDLWE4oakSgC
}
\references{
  None
}
\examples{
\dontrun{
library(agridat)
data(rangaswamy.groundnut.uniformity)
dat <- rangaswamy.groundnut.uniformity

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(12*.75)/(8*4),
        main="rangaswamy.groundnut.uniformity")

}
}
\keyword{datasets}
