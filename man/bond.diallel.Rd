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
    \item{\code{female}}{female parent}
    \item{\code{male}}{male parent}
    \item{\code{yield}}{yield, grams/plot}
    \item{\code{stems}}{stems per plot}
    \item{\code{nodes}}{podded nodes per stem}
    \item{\code{pods}}{pods per podded node}
    \item{\code{seeds}}{seeds per pod}
    \item{\code{weight}}{weight (g) per 100 seeds}
    \item{\code{height}}{height (cm) in April}
    \item{\code{width}}{width (cm) in April}
    \item{\code{flower}}{mean flowering date in May}
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
  http://doi.org/10.1017/S0021859600017329
}
\references{
  Peter John, \emph{Statistical Design and Analysis of Experiments}, p. 85.
}
\examples{

data(bond.diallel)
dat <- bond.diallel

libs(lattice)
splom(dat[,3:11], main="bond.diallel")

# Needs an example.  Bond says yield heterosis of F1 hybrids over parent
# means is 22.56, but I cannot match.

# See man page for FDdata in R package sommer

}
\keyword{datasets}
