\name{cochran.beets}
\alias{cochran.beets}
\docType{data}
\title{
  Yield and number of plants in a sugarbeet fertilizer experiment
}
\description{
 Yield and number of plants in a sugarbeet fertilizer experiment.
}
\usage{data("cochran.beets")}
\format{
  A data frame with 42 observations on the following 4 variables.
  \describe{
    \item{\code{fert}}{fertilizer treatment}
    \item{\code{block}}{block}
    \item{\code{yield}}{yield, tons/acres}
    \item{\code{plants}}{number of plants per plot}
  }
}
\details{
  Yield (tons/acre) and number of beets per plot.  Fertilizer
  treatments combine superphosphate (P), muriate of potash (K),
  and sodium nitrate (N).
}
\source{
  George Snedecor (1946).
  \emph{Statisitcal Methods}, 4th ed. Table 12.13, p. 332.
}
\references{
  H. Fairfield Smith (1957).
  Interpretation of Adjusted Treatment Means and Regressions in Analysis
  of Covariance.
  \emph{Biometrics}, 13, 282-308.
  https://doi.org/10.2307/2527917
}
\examples{
\dontrun{

library(agridat)
data(cochran.beets)
dat = cochran.beets

# P has strong effect
libs(lattice)
xyplot(yield ~ plants|fert, dat, main="cochran.beets") 

}
}
\keyword{datasets}
