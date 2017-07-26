\name{gomez.seedrate}
\alias{gomez.seedrate}
\docType{data}
\title{
  Rice yield at six different densities
}
\description{
  Rice yield at six different densities
}

\format{
  A data frame with 24 observations on the following 3 variables.
  \describe{
    \item{\code{rate}}{kg seeds per hectare}
    \item{\code{rep}}{rep (block), four levels}
    \item{\code{yield}}{yield, kg/ha}
  }
}
\details{
  Rice yield at six different densities in an RCB design.
}
\source{
  Gomez, K.A. and Gomez, A.A. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 26.

  Used with permission of Kwanchai Gomez.
}

\examples{

data(gomez.seedrate)
dat <- gomez.seedrate

require(lattice)
xyplot(yield ~ rate, data=dat, group=rep, type='b',
       main="gomez.seedrate", auto.key=list(columns=4))

# Quadratic response.  Use raw polynomials so we can compute optimum
m1 <- lm(yield ~ rep + poly(rate,2,raw=TRUE), dat)
-coef(m1)[5]/(2*coef(m1)[6]) # Optimum is at 29

# Plot the model predictions
if(require(latticeExtra)){
newdat <- expand.grid(rep=levels(dat$rep), rate=seq(25,150))
newdat$pred <- predict(m1, newdat)
p1 <- aggregate(pred ~ rate, newdat, mean) # average reps
  xyplot(yield ~ rate, data=dat, group=rep, type='b',
         main="gomez.seedrate (with model predictions)", auto.key=list(columns=4)) +
    xyplot(pred ~ rate, p1, type='l', col='black', lwd=2)
}

}
\keyword{datasets}
