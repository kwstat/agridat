\name{goulden.barley.uniformity}
\alias{goulden.barley.uniformity}
\docType{data}
\title{
  Uniformity trial of barley
}
\description{
  Uniformity trial of barley
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
  https://archive.org/stream/methodsofstatist031744mbp#page/n31/mode/2up
}
\references{
  See LeClerg, Leonard, Clark. \emph{Field Plot Technique}.
  https://archive.org/stream/fieldplottechniq00leon#page/38/mode/2up
}

\examples{

data(goulden.barley.uniformity)
dat <- goulden.barley.uniformity

if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          aspect=1, main="goulden.barley.uniformity")
}


# See LeClerg, Leonard, Clark
hist(dat$yield, main="goulden.barley.uniformity",
     breaks=c(21,40,59,78,97,116,135,154,173,192,211,230,249)+.5)

}
\keyword{datasets}
