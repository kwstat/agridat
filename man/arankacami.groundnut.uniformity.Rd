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
  The year of the experiment is unknown, but before 1995.
  
  Basic plot size is 0.75 m (rows) x  4 m (columns).
  
}
\source{
  Ira Arankacami, R. Rangaswamy. (1995).
  A Text Book of Agricultural Statistics.
  New Age International Publishers.
  Table 19.1.
  https://www.google.com/books/edition/A_Text_Book_of_Agricultural_Statistics/QDLWE4oakSgC
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
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(12*.75)/(8*4),
        main="arankacami.groundnut.uniformity")

}
}
\keyword{datasets}
