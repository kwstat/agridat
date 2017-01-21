\name{christidis.wheat.uniformity}
\alias{christidis.wheat.uniformity}
\docType{data}
\title{
  Uniformity trial of wheat
}
\description{
  Uniformity trial of wheat at Cambridge, UK in 1931.
}
\usage{data("christidis.wheat.uniformity")}
\format{
  A data frame with 288 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield}
  }
}
\details{
  
Two blocks, 24 rows each. In block A, each 90-foot row was divided into
12 units, each unit 7.5 feet long. Rows were 8 inches wide.

Field length: 24 rows * 8 inches = 16 feet

Field width: 12 units * 7.5 feet = 90 feet

}

\source{
  
  Christidis, Basil G (1931).
  The importance of the shape of plots in field experimentation.
  \emph{The Journal of Agricultural Science}, 21, 14-37. Table VI, p. 28.
  http://dx.doi.org/10.1017/S0021859600007942

}
\references{
  None
}

\examples{

data(christidis.wheat.uniformity)
dat <- christidis.wheat.uniformity

# sum(dat$yield) # Match Christidis

if(require(desplot)){
  desplot(yield ~  col*row, data=dat,
          flip=TRUE, aspect=16/90, # true aspect
          main="christidis.wheat.uniformity")
}

}
\keyword{datasets}
