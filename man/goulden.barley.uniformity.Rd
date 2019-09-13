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
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, grams per plot}
  }
}
\details{
  Yield in grams for 400 square-yard barley plots.

  Field width: 20 plots x 3 feet = 60 feet

  Field length: 20 plots x 3 feet = 60 feet

}
\source{
  C. H. Goulden, (1939).
  \emph{Methods of statistical analysis}, 1st ed. Page 18.  
  https://archive.org/stream/methodsofstatist031744mbp
  
}
\references{
  Erwin LeClerg, Warren Leonard, Andrew Clark (1962).
  \emph{Field Plot Technique}, 2nd ed. Page 27.

  Alternatively, page 39 in 1939 edition of "Field Plot Technique".
  https://archive.org/stream/fieldplottechniq00leon
}

\examples{
\dontrun{

library(agridat)
data(goulden.barley.uniformity)
dat <- goulden.barley.uniformity

libs(desplot)
desplot(yield ~ col*row, data=dat,
        aspect=20/20, # true aspect
        main="goulden.barley.uniformity")

# Left skewed distribution. See LeClerg, Leonard, Clark
hist(dat$yield, main="goulden.barley.uniformity",
     breaks=c(21,40,59,78,97,116,135,154,173,192,211,230,249)+.5)

}  
}
\keyword{datasets}
