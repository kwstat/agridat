\name{lyons.wheat}
\alias{lyons.wheat}
\docType{data}
\title{
  Multi-environment trial of winter wheat at 12 sites in 4 years.
}
\description{
  Yield of winter wheat at 12 sites in 4 years.
}

\format{
  A data frame with 48 observations on the following 3 variables.
  \describe{
    \item{\code{loc}}{location, 12 levels}
    \item{\code{year}}{year, numeric}
    \item{\code{yield}}{yield (kg)}
  }
}
\details{
  Krzanowski uses this briefly for multi-dimensional scaling.
}
\source{
  R. Lyons (1980). A review of multidimensional scaling.
  Unpublished M.Sc. dissertation, University of Reading.
}
\references{
  Krzanowski, W.J. (1988)
  \emph{Principles of multivariate analysis}. Oxford University Press.
}

\examples{

data(lyons.wheat)
dat <- lyons.wheat

require(lattice)
xyplot(yield~factor(year), dat, group=loc,
  main="lyons.wheat",
  auto.key=list(columns=4), type=c('p','l'))
}
\keyword{datasets}
