# patterson.sugarbeet.r
# Time-stamp: c:/x/rpack/agridat2/patterson.sugarbeet.r

# Source:
# Book: Statistical Methods for Plant Variety Evaluation, table 9.13
# Chapter: Analysis of series of variety trials

# I could match _some_ of the adjusted means in the book, but
# not all of them.  Weird.  Decided not to use this data.

library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-unused/")
dat <- import("patterson.sugarbeet.csv")
library(reshape2)
dm <- melt(dat, id.var=c('year','variety'))
names(dm) <- c('year','gen','loc','yield')
dat <- dm
dat <- subset(dat, !is.na(yield))

patterson.sugarbeet <- dat
# ----------------------------------------------------------------------------

dat <- patterson.sugarbeet
dat <- transform(dat, env=factor(paste0(year,loc)),
                 gen=factor(gen), yrf=factor(year))

library(asreml)
library(lucid)

# Single-stage FITCON
m1 <- asreml(yield ~ gen, data=dat, random= ~ env)
predict(m1, classify="gen")$pred
m1 <- asreml(yield ~ gen + env, data=dat)
predict(m1, classify="gen")$pred
m1 <- asreml(yield ~ env, data=dat, random = ~gen)
predict(m1, classify="gen")$pred

# 9.15 single-stage
m1 <- asreml(yield ~ gen + yrf + loc%in%yrf +gen:yrf, data=dat)
predict(m1, classify="gen")$pred

# 9.15 reml
m1 <- asreml(yield ~ gen, data=dat, random=~yrf+yrf:loc + gen:yrf)
predict(m1, classify="gen")$predictions
vc(m1)

# 87 only
m1 <- asreml(yield ~ gen + loc, data=dat, subset=year==1987)
predict(m1, classify="gen")$predictions

# 1990 should be just simple means
d1 <- droplevels(subset(dat, year==1990))
acast(d1, gen~loc, value.var='yield')
tapply(d1$yield, d1$gen, mean)-10.228182+9.774

# 1991 should be just simple means.  Maddeningly, some numbers match
d2 <- droplevels(subset(dat, year==1991))
acast(d2, gen~loc, value.var='yield')
tapply(d2$yield, d2$gen, mean)
