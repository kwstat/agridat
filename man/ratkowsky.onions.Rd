\name{ratkowsky.onions}
\alias{ratkowsky.onions}
\title{
  Onion yields for different densities at two locations
}
\description{
  Onion yields for different densities at two locations
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{density}{planting density (plants per square meter)}
    \item{yield}{yield (g / plant)}
    \item{loc}{location, Purnong Landing or Virginia}
  }
}
\details{
  Spanish white onions.
}
\source{
  Ratkowsky, D. A. (1983).
  \emph{Nonlinear Regression Modeling: A Unified Practical Approach.}
  New York: Marcel Dekker.
}
\references{
  Ruppert, D., Wand, M.P. and Carroll, R.J. (2003).
  \emph{Semiparametric Regression}. Cambridge University Press.
  https://stat.tamu.edu/~carroll/semiregbook/
}
\examples{
\dontrun{

library(agridat)
data(ratkowsky.onions)
dat <- ratkowsky.onions

# Model inverse yield as a quadratic.  Could be better...
libs(lattice)
dat <- transform(dat, iyield = 1/yield)
m1 <- lm(iyield ~ I(density^2)*loc, dat)
dat$pred <- predict(m1)

libs(latticeExtra)
foo <- xyplot(iyield ~ density, data=dat, group=loc, auto.key=TRUE,
               main="ratkowski.onions",ylab="Inverse yield")
foo + xyplot(pred ~ density, data=dat, group=loc, type='l')

}
}
\keyword{datasets}
