# hernandez.nitrogen.r
# Time-stamp: c:/x/rpack/agridat2/hernandez.nitrogen.r

library(asreml)
#library(dataframe)
library(kw)
library(Hmisc)
library(lattice)

# ----------------------------------------------------------------------------

dat <- hernandez.nitrogen
cprice <- 118.1 # $118.1/Mg or $3/bu
nprice <- 0.6615 # $0.66/kg N or $0.30/lb N

# Hernandez optimized yield with a constraint on the ratio of the prices.
# Simpler to just calculate the income and optimize that.
dat <- transform(dat, inc = yield * cprice - nitro * nprice)
xyplot(inc ~ nitro|site, dat, groups=rep, auto.key=list(columns=4))

# Site 5 only
dat1 <- subset(dat, site=='S5')

# When we optimize on income, a simple quadratic model works just fine,
# and matches the results of the nls model below.
lm1 <- lm(inc ~ 1 + nitro + I(nitro^2), data=dat1) # Note, 'poly' gives weird coefs
require("latticeExtra")
xyplot(inc~nitro, dat1) + xyplot(fitted(lm1) ~ nitro, dat1, type='l')
c1 <- coef(lm1)
-c1[2] / (2*c1[3]) # Optimum nitrogen is 192 for site 5

\dontrun{
# Use the delta method to get a conf int
require("car")
del1 <- deltaMethod(lm1, "-b1/(2*b2)", parameterNames= paste("b", 0:2, sep=""))
# Simple Wald-type conf int for optimum
del1$Est +  c(-1,1) * del1$SE * qt(1-.1/2, nrow(dat1)-length(coef(lm1)))

# Nonlinear regression
# Reparameterize b0 + b1*x + b2*x^2 using th2 = -b1/2b2 so that th2 is optimum
nls1 <- nls(inc ~ th11- (2*th2*th12)*nitro + th12*nitro^2,
          data = dat1, start = list(th11 = 5, th2 = 150, th12 =-0.1),)
summary(nls1)

# Wald conf int
wald <- function(object, alpha=0.1){
  nobs <- length(resid(object))
  npar <- length(coef(object))
  est <- coef(object)
  stderr <- summary(object)$parameters[,2]
  tval <- qt(1-alpha/2, nobs-npar)
  ci <- cbind(est - tval * stderr, est + tval * stderr)
  colnames(ci) <- paste(round(100*c(alpha/2, 1-alpha/2), 1), "%", sep= "")
  return(ci)
}

round(wald(nls1),4)

# Likelihood conf int
library(MASS)
confint(nls1, "th2", level = 0.9)
plot(profile(nls1,  "th2"),  conf  =  c(50, 80, 90, 95)/100)

# Bootstrap conf int
library(boot)
dat1$fit <- fitted(nls1)
bootfun <- function(rs, i) { # bootstrap the residuals
  dat1$y <- dat1$fit + rs[i]
  coef(nls(y ~ th11- (2*th2*th12)*nitro + th12*nitro^2, dat1, start = coef(nls1)))
}
res1 <- scale(resid(nls1), scale = FALSE) # remove the mean.  Why? It is close to 0.
boot1 <- NULL # Sometime the bootstrap fails, so delete previous results.
boot1 <- boot(res1, bootfun, R = 500)
boot.ci(boot1, index = 2, type = c("norm", "basic", "perc", "bca"), conf = 0.9)

}

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

# Multilocation model

require(lme4)
m2 <- lmer(inc ~ 1 + nitro + I(nitro^2) +
           (1+nitro+I(nitro^2)|loc), data=dat)
pdat <- expand.grid(nitro=seq(from=0, to=250, length=50), loc=unique(dat$loc))
pdat$pred.n <- predict(m2, newdata=pdat) # narrow-space
pdat$pred.w <- predict(m2, newdata=pdat, REform=~(1|loc)) # wide-space

summary(m2)

# What to do with the predictions?  We have to make a decision about
# individual fields, so why is a wide-area optimum useful?
# Maybe the idea could be to leverage response curves across locations
# so that if one location is freaky (upside down curve), the idea of
# "borrowing strength" from other locations can help create a sensible
# local prediction.
xyplot(inc ~ nitro|loc, dat, groups=rep, auto.key=list(columns=4)) +
  xyplot(pred.w ~ nitro|loc, pdat, type='l', col='black', lwd=2) +
  xyplot(pred.n ~ nitro|loc, pdat, type='l')
