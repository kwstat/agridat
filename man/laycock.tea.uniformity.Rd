\name{laycock.tea}
\alias{laycock.tea}
\docType{data}
\title{
  Uniformity trial of tea
}
\description{
  Uniformity trial of tea
}
\usage{data("laycock.tea")}
\format{
  A data frame with 54 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield}
  }
}
\details{
  Data transcribed from Zimmerman & Harville, page 224.
}
\source{
  Laycock, D. H. (1955).
  The effect of plot shape in reducing the errors of tea experiments.
  \emph{Tropical Agriculture}, 32, 107-114.
}
\references{
  Zimmerman, Dale L., and David A. Harville. (1991).
  A random field approach to the analysis of field-plot experiments
  and other spatial experiments.
  \emph{Biometrics}, 47, 223-239.
}
\examples{
data(laycock.tea)
dat <- laycock.tea

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          main="laycock.tea", flip=TRUE)
}

}
\keyword{datasets}
