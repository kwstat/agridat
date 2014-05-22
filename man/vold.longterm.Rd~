\name{vold.longterm}
\alias{vold.longterm}
\docType{data}
\title{
  Long-term barley yields at different fertilizer levels
}
\description{
  Long-term barley yields at different fertilizer levels
}
\usage{data(vold.longterm)}
\format{
  A data frame with 76 observations on the following 3 variables.
  \describe{
    \item{\code{year}}{year, numeric}
    \item{\code{nitro}}{nitrogen fertilizer, grams/m^2}
    \item{\code{yield}}{yield, grams/m^2}
  }
}
\details{
  Trials conducted at Osaker, Norway.  Nitrogen fertilizer amounts were
  increased by twenty percent in 1978.

  Vold (1998) fit a Michaelis-Menten type equation with a different
  maximum in each year and a decreasing covariate for non-fertilizer
  nitrogen.

  Miguez used non-linear mixed effects model with an asymptotic curve.
}
\source{
  Vold, Arild (1998).
  A generalization of ordinary yield response functions.
  \emph{Ecological modelling}, 108, 227-236.
}

\references{
  Fernando E. Miguez (2008).
  Using Non-Linear Mixed Models for Agricultural Data.
}

\examples{
dat <- vold.longterm

require(lattice)
require(nlme)
require(MASS) # for 'confint'
require(latticeExtra) # for layers

foo1 <- xyplot(yield ~ nitro | factor(year), data = dat,
       as.table=TRUE, type = "o",
       main=list("vold.longterm", cex=1.5),
       xlab = list("N fertilizer",cex=1.5),
       ylab = list("Yield", cex=1.5))
# print(foo1)

\dontrun{
# Long term trend shows decreasing yields
xyplot(yield ~ year , data = dat, group=nitro, type='o',
       main="vold.longterm")

# First, asymptotic model for each year
m1.nls <- nls(yield ~ SSasymp(nitro, max, int, lograte), data=dat)
summary(m1.nls)
confint(m1.nls)

# Raw data plus global model.  Year variation not modeled.
pdat <- data.frame(nitro=seq(0,14,0.5))
pdat$pred <- predict(m1.nls, newdata=pdat)
foo1 + xyplot(pred ~ nitro , data = pdat, as.table=TRUE, type='l', col='red', lwd=2)

# Separate fit for each year.  This is overfitting with 3x19=57 params.
m2.lis <- nlsList(yield ~ SSasymp(nitro,max,int,lograte) | year, data=dat)
plot(intervals(m2.lis),layout = c(3,1)) # lograte might be same for each year
}

# Fixed overall asymptotic model, plus random deviations for each year
# Simpler code, but less clear about what model is fit: m3.lme <- nlme(m2.lis)
m3.lme <- nlme(yield ~ SSasymp(nitro, max, int, lograte), data=dat,
               groups = ~ year,
               fixed = list(max~1, int~1, lograte~1),
               random= max + int + lograte ~ 1,
               start= c(max=300, int=100, rate=-2))

## # Fixed effects are similar for the nls/lme models
## coef(m1.nls)
## fixef(m3.lme)
## # Random effects are normally distributed
## qqnorm(m3.lme, ~ ranef(.),col="black")
## # Note the trend in intercept effects over time
## plot(ranef(m3.lme),layout=c(3,1))

## # Correlation between int,lograte int,max may not be needed
## intervals(m3.lme,which="var-cov")
## pairs(m3.lme,pch=19,col="black")

## # Model with int uncorrelated with max,lograte.  AIC is worse.
## # fit4.lm3 <- update(m3.lme, random=pdBlocked(list(max+lograte~1,int ~ 1)))
## # intervals(fit4.lm3, which="var-cov")
## # anova(m3.lme, fit4.lm3)

# Random-effect model gives an excellent fit
pdat2 <- expand.grid(year=1970:1988, nitro=seq(0,15,length=50))
pdat2$pred <- predict(m3.lme, new=pdat2)
pdat2$predf <- predict(m3.lme, new=pdat2, level=0)
update(foo1, type='p') + # raw data
  xyplot(predf~nitro|year, data=pdat2, type='l', col="red") + # global
  xyplot(pred~nitro|year, data=pdat2, type='l', col="darkgreen", lwd=2)

## # Income is maximized at about 15
## pdat2 <- transform(pdat2, income = predf*2 - 7*nitro)
## with(pdat2, xyplot(income~nitro))

}
\keyword{datasets}
