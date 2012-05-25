\name{goulden.barley}
\alias{goulden.barley}
\docType{data}
\title{
  Barley uniformity trial
}
\description{
  Barley uniformity trial  
}
\usage{data(goulden.barley)}
\format{
  A data frame with 400 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
    \item{\code{yield}}{Yield, grams per plot}
  }
}
\details{
  Yield in grams for 400 square-yard barley plots.
}
\source{
  C. H. Goulden, 1939. \emph{Methods of statistical analysis}.
  Wiley. Page 18.
  \url{http://archive.org/details/methodsofstatist031744mbp}
}
\references{
  See LeClerg, Leonard, Clark. \emph{Field Plot Technique}. Page 27.
}
\examples{

dat <- goulden.barley

desplot(yield ~ col*row, data=dat)

# See LeClerg, Leonard, Clark
hist(dat$yield, breaks=c(21,40,59,78,97,116,135,154,173,192,211,230,249)+.5)
}
\keyword{datasets}
