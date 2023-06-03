# payne.wheat.R

## ---------------------------------------------------------------------------

libs(dplyr,rio,reshape2)
setwd("c:/drop/rpack/agridat/data-raw/")

dat <- import("payne.wheat.xlsx")
dat <- melt(dat, id.var=c('rotation','nitro'))
dat <- rename(dat, yield=value, year=variable)
dat <- transform(dat,
                 year=as.numeric(as.character(year)))
head(dat)

payne.wheat <- dat

# --------------------------

library(agridat)
data(payne.wheat)
dat <- payne.wheat

libs(asreml)

# make factors
dat <- transform(dat,
                 rotf = factor(rotation),
                 yrf = factor(year),
                 nitrof = factor(nitro))

# visualize the response to nitrogen
libs(lattice)
# Why does Payne use nitrogen factor, when it is an obvious polynomial term?
# Probably doesn't matter too much.
xyplot(yield ~ nitro|yrf, dat,
       groups=rotf, type='b',
       auto.key=list(columns=6),
       main="payne.wheat")

# What are the long-term trends?  Yields are decreasing
xyplot(yield ~ year | rotf, data=dat, groups=nitrof,
       type='l', auto.key=list(columns=4))


# 1: Fixed model with constant variance
m1 <- asreml(fixed=yield ~ rotf * nitrof * pol(yr,4), data=dat,
             random=~yrf)
summary(m1)
wald(m1, denDF="algebraic")

# AIC for this model (on deviance scale - smaller = better)
aic1 <- -2*(m1$loglik - length(m1$gammas))
aic1 # 584

# 2: Fixed model with separate variances across yrs
m2 <- asreml(fixed=yield ~ rotf*nitrof*pol(yr,4), data=dat,
             random=~yrf, rcov=~at(yrf):id(units))
summary(m2)
wald(m2)
# calculate AIC
aic2 <- -2*(m2$loglik - length(m2$gammas))
aic2 # 548.  Better than model 1

# Manually create individual polynomial terms
matpol <- poly(dat$yr,degree=4)
dat$linyr <- matpol[1:480,1]
dat$quadyr <- matpol[1:480,2]
dat$cubyr <- matpol[1:480,3]
dat$quaryr <- matpol[1:480,4]

# Model 3: model 2 with polynomial components separated
m3 <- asreml(fixed=yield ~ rotf * nitrof * (linyr+quadyr+cubyr+quaryr),
             data=dat, random=~yrf, rcov=~at(yrf):id(units))
summary(m3)
wald(m3, denDF="default") # table 5 of Payne

# Model 4: drop cubic and quartic polynomial components
m4 <- asreml(fixed=yield ~ rotf*nitrof*(linyr+quadyr),
             data=dat, random=~yrf, rcov=~at(yrf):id(units))
summary(m4)
wald(m4, denDF="default") # table 6 of Payne

# Model 5: drop 3-way interaction and return to pol function (easier prediction)
m5 <- asreml(yield ~ rotf * nitrof * pol(year,2) -
               (rotf:nitrof:pol(year,2)),
             data=dat,
             random = ~yrf,
             residual = ~ dsum( ~ units|yrf))
summary(m5)$varcomp # Table 7 of Payne
# vc(m5) # kw
wald(m5, denDF="default") # Table 8 of Payne

# Predictions of three-way interactions from final model
p5 <- predict(m5, classify="rotf:nitrof:year")
p5 <- p5$pvals # Matches Payne table 8
p5

# Plot the predictions.  Matches Payne figure 1
xyplot(predicted.value ~ year | rotf, data=p5, groups=nitrof,
       ylab="yield t/ha", type='l', auto.key=list(columns=5))


