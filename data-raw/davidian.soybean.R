# davidian.soybean.R
# Time-stamp: <01 Dec 2018 20:07:28 c:/x/rpack/agridat/data-done/davidian.soybean.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

dat <- nlme::Soybean
dat <- as.data.frame(dat)
names(dat) <- c('plot','variety','year','day','weight')
dat$year <- as.numeric(as.character(dat$year))
davidian.soybean <- dat
# ----------------------------------------------------------------------------

dat <- davidian.soybean
dat$year <- factor(dat$year)

require(lattice)
#xyplot(weight ~ day|plot, dat, layout=c(8,6))
xyplot(weight ~ day|variety*year, dat, group=plot, type='l',
       main="davidian.soybean")

require(nlme)
# the only way to keep your sanity with nlme is to use groupedData objects
datg <- groupedData(weight ~ day|plot, dat)

# separate fixed-effect model for each plot
# 1988P6 gives unusual estimates
m1 <- nlsList(SSlogis, data=datg, subset = plot != "1988P6") 
plot(m1) # seems heterogeneous
plot(intervals(m1), layout=c(3,1)) # clear year,variety effects in Asym

# A = maximum, B = time of half A = steepness of curve
# C = sharpness of curve (smaller = sharper curve)

# switch to mixed effects
m2 <- nlme(weight ~ A / (1+exp(-(day-B)/C)),
           #weight ~ SSlogis(day,A,B,C),
           data=datg,
           fixed=list(A ~ 1, B ~ 1, C ~ 1),
           random = A +B +C ~ 1,
           start=list(fixed = c(17,52,7.5))) # no list!

# add covariates for A,B,C effects, correlation, weights
# not necessarily best model, but it shows the syntax
m3 <- nlme(weight ~ A / (1+exp(-(day-B)/C)),
           #weight ~ SSlogis(day,A,B,C),
           data=datg,
           fixed=list(A ~ variety + year,
                      B ~ year,
                      C ~ year),
           random = A +B +C ~ 1,
           start=list(fixed= c(19,0,0,0,
                               55,0,0,
                               8,0,0)),
           correlation = corAR1(form = ~ 1|plot),
           weights=varPower(), # really helps
           control=list(mxMaxIter=200))

plot(augPred(m3), layout=c(8,6), main="davidian.soybean - model 3")

# ----------------------------------------------------------------------------

dat88 <- subset(dat, year=="1988")

# ID error structure ---
m1 <- gls(weight ~ variety + day + variety:day,
          correlation = varIdent(form = ~ 1),
          weights = varIdent(form = ~ 1),
          data = dat88)
anova(m1)
plot(m1)

# CS error structure ---
m2 <- gls(weight ~ variety + day + variety:day,
          correlation = corCompSymm(form = ~ day|plot),
          weights = varIdent(form = ~ 1),
          data = dat88)
anova(m2)
plot(m2)

# CSH error structure ---
m3 <- gls(weight ~ variety + day + variety:day,
          correlation = corCompSymm(form = ~ day|plot),
          weights = varIdent(form = ~ 1|day),
          data = dat88)
anova(m3)
plot(m3)

# DIAG error structure ---
m4 <- gls(weight ~ variety + day + variety:day,
          correlation = varIdent(form = ~ 1),
          weights = varIdent(form = ~ 1|day),
          data = dat88)
anova(m4)
plot(m4)

# AR(1) error structure ---
m5 <- gls(weight ~ variety + day + variety:day,
          correlation = corAR1(form = ~ 1|plot),
          weights = varIdent(form = ~ 1),
          data = dat88)
anova(m5)
plot(m5)

# ARH(1) error structure ---
m6 <- gls(weight ~ variety + day + variety:day,
          correlation = corAR1(form = ~ 1|plot),
          weights = varIdent(form = ~ 1|day),
          data = dat88)
anova(m6)
plot(m6)

# US error structure. Does not converge.
m7 <- gls(weight ~ variety + day + variety:day,
          correlation = corSymm(form = ~ 1|plot),
          weights = varIdent(form = ~ 1|day),
          data = dat88)
#anova(m7)
#plot(m7)

# AIC ---
AIC(m1) # ID error structure
AIC(m2) # CS error structure
AIC(m3) # CSH error structure
AIC(m4) # DIAG error structure
AIC(m5) # AR(1) error structure
AIC(m6) # ARH(1) error structure. Far best.
AIC(m7) # US error structure

# variance increases with a power of the absolute fitted values
fm1 <- gnls(weight ~ SSlogis(day, Asym, xmid, scal), data=dat,
            weights = varPower())
summary(fm1)

# ----------------------------------------------------------------------------

