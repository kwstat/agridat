\name{senshu.rice}
\alias{senshu.rice}
\docType{data}
\title{
  Multi-environment trial of rice, with solar radiation and temperature
}
\description{
  Response of rice to solar radiation and temperature
}

\format{
  A data frame with 40 observations on the following 7 variables.
  \describe{
    \item{\code{country}}{country}
    \item{\code{loc}}{location}
    \item{\code{year}}{year of planting, last two digits}
    \item{\code{month}}{month of planting}
    \item{\code{rad}}{solar radiation}
    \item{\code{mint}}{minimum temperature}
    \item{\code{yield}}{yield t/ha}
  }
}
\details{
  Minimum temperature is the average across 30 days post flowering.

  Opinion: Fitting a quadratic model to this data makes no sense.
}

\source{
  Seshu, D. V. and Cady, F. B. 1984.
  Response of rice to solar radiation and temperature estimated from international yield trials.
  \emph{Crop Science}, 24, 649-654.
  http://doi.org/10.2135/cropsci1984.0011183X002400040006x
}

\references{
  Walter W. Piegorsch, A. John Bailer. (2005)
  \emph{Analyzing Environmental Data}, Wiley.
}

\examples{
\dontrun{
  
library(agridat)

data(senshu.rice)
dat <- senshu.rice

# Model 1 of Senshu & Cady
m1 <- lm(yield ~ 1 + rad + mint + I(mint^2), dat)
coef(m1)

# Use Fieller to calculate conf int around optimum minimum temp
# See: Piegorsch & Bailer, p. 31.
# Calculation derived from vegan:::fieller.MOStest
m2 <- lm(yield ~ 1 + mint + I(mint^2), dat)
b1 <- coef(m2)[2]
b2 <- coef(m2)[3]
vc <- vcov(m2)
sig11 <- vc[2,2]
sig12 <- vc[2,3]
sig22 <- vc[3,3]
u <- -b1/2/b2
tval <- qt(1-.05/2, nrow(dat)-3)
gam <- tval^2 * sig22 / b2^2
x <- u + gam * sig12 / (2 * sig22)
f <- tval / (-2*b2)
sq <- sqrt(sig11 + 4*u*sig12 + 4*u^2*sig22 - gam * (sig11 - sig12^2 / sig22) )
ci <- (x + c(1,-1)*f*sq) / (1-gam)
plot(yield ~ mint, dat, xlim=c(17, 32),
main="senshu.rice: Quadratic fit and Fieller confidence interval",
     xlab="Minimum temperature", ylab="Yield")
lines(17:32, predict(m2, new=data.frame(mint=17:32)))
abline(v=ci, col="blue")
}
}
\keyword{datasets}
