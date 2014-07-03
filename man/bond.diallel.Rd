\name{bond.diallel}
\alias{bond.diallel}
\docType{data}
\title{
  Diallel cross of winter beans
}
\description{
  Diallel cross of winter beans
}

\format{
  A data frame with 36 observations on the following 3 variables.
  \describe{
    \item{\code{female}}{Female parent factor}
    \item{\code{male}}{Male parent factor}
    \item{\code{yield}}{Yield, grams/plot}
    \item{\code{stems}}{Stems per plot}
    \item{\code{nodes}}{Podded nodes per stem}
    \item{\code{pods}}{Pods per podded node}
    \item{\code{seeds}}{Seeds per pod}
    \item{\code{weight}}{Weight (g) per 100 seeds}
    \item{\code{height}}{Height (cm) in April}
    \item{\code{width}}{Width (cm) in April}
    \item{\code{flower}}{Mean flowering date in May}
  }
}
\details{
  Yield in grams/plot for diallel crosses between inbred lines of winter
  beans.  Values are means over two years.
}
\source{
  D. A. Bond (1966). Yield and components of yield in diallel crosses
  between inbred lines of winter beans (Viciafaba).
  \emph{The Journal of Agricultural Science}, 67, 325--336.
}
\references{
  Peter John, \emph{Statistical Design and Analysis of Experiments}, p. 85.
}
\examples{
dat <- bond.diallel

splom(dat[,3:11], main="bond.diallel")

# Needs an example.  Bond says yield heterosis of F1 hybrids over parent
# means is 22.56, but I cannot match.
}
\keyword{datasets}
