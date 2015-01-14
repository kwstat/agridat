\name{goulden.barley.uniformity}
\alias{goulden.barley.uniformity}
\docType{data}
\title{
  Barley uniformity trial
}
\description{
  Barley uniformity trial
}

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

data(goulden.barley.uniformity)
dat <- goulden.barley.uniformity

desplot(yield ~ col*row, data=dat, main="goulden.barley.uniformity")

# See LeClerg, Leonard, Clark
hist(dat$yield, main="goulden.barley.uniformity",
     breaks=c(21,40,59,78,97,116,135,154,173,192,211,230,249)+.5)

}
\keyword{datasets}
