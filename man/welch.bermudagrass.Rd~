\name{welch.bermudagrass}
\alias{welch.bermudagrass}
\docType{data}
\title{
  Yield of bermuda grass with N, P, K fertilizers
}
\description{
  Yield of bermuda grass with N, P, K fertilizers
}

\format{
  A data frame with 64 observations on the following 4 variables.
  \describe{
    \item{\code{n}}{nitrogen fertilizer, pounds/acre}
    \item{\code{p}}{phosphorus, lb/ac}
    \item{\code{k}}{potassium, lb/ac}
    \item{\code{yield}}{yield of grass, tons/ac}
  }
}
\details{
  The experiment was conducted 1955, 1956, and 1957.  There were 3
  blocks. The harvests were oven-dried.  Each value is the mean for 3
  years and 3 replications.  In most cases, the yield increased with
  additions of the fertilizer nutrients.
}
\source{
  Welch, Louis Frederick and Adams, William Eugenius and Carmon,
  JL. 1963. Yield response surfaces, isoquants, and economic fertilizer
  optima for Coastal Bermudagrass. \emph{Agronomy Journal}, 55, 63-67.
  \url{https://dl.sciencesocieties.org/publications/aj/abstracts/55/1/AJ0550010063}
}

\examples{

dat <- welch.bermudagrass

# Welch uses 100-pound units of n,p,k
dat <- transform(dat, n=n/100, p=p/100, k=k/100)
m1 <- lm(yield ~ n + p + k + I(n^2) + I(p^2) + I(k^2) + n:p + n:k + p:k + n:p:k, data=dat)
signif(coef(m1),4) # These match the 3-yr coefficients of Welch, Table 2
## (Intercept)           n           p           k      I(n^2)      I(p^2)
##     1.94300     2.00700     1.47100     0.61880    -0.33150    -1.29500
##      I(k^2)         n:p         n:k         p:k       n:p:k
##    -0.37430     0.20780     0.18740     0.23480     0.02789

require(latticeExtra)
useOuterStrips(xyplot(yield~n|factor(p)*factor(k), data=dat, type='l',
                      main="welch.bermudagrass: yield for each P*K", xlab="nitro"))

# Welch Fig 4.  Modeled response curves

d1 <- expand.grid(n=seq(0, 4, length=50), p=0, k=0)
d1$pred <- predict(m1, d1)
d2 <- expand.grid(n=0, p=0, k=seq(0, 1.68, length=50))
d2$pred <- predict(m1, d2)
d3 <- expand.grid(n=0, p=seq(0, .88, length=50), k=0)
d3$pred <- predict(m1, d3)
\dontrun{  # Causes Rcmd check to say: 'plot region too large'
op <- par(mfrow=c(1,3))
plot(pred~n, data=d1, type='l', ylim=c(0,6), xlab="N 100 lb/ac", ylab="")
plot(pred~k, data=d2, type='l', ylim=c(0,6), xlab="K 100 lb/ac", ylab="")
title("welch.bermudagrass - yield vs fertilizer", outer=TRUE, line= -3)
plot(pred~p, data=d3, type='l', ylim=c(0,6), xlab="P 100 lb/ac",
ylab="")
par(op)
}

# Grid-search optimization of fertilizer quantities, using
# $25/ton for grass, $.12/lb for N, $.18/lb for P, $.07/lb for K
# Similar to Example 5 in Table 4 of Welch
d4 <- expand.grid(n=seq(3,4,length=20), p=seq(.5, 1.5, length=20),
                  k=seq(.8, 1.8, length=20))
d4$pred <- predict(m1, newdata=d4)
d4 <- transform(d4, income = 25*pred - .12*n*100 + -.18*p*100 -.07*k*100)
d4[which.max(d4$income),] # Optimum at 300 lb N, 71 lb P, 148 lb K

}
\keyword{datasets}
