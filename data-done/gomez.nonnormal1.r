# gomez.nonnormal1.r
# Time-stamp: <19 Nov 2016 20:42:34 c:/x/rpack/agridat/data-done/gomez.nonnormal1.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- import("")

dat <- dat0,

str(dat)
describe(dat)

dat <- data.frame(trt=rep(c('T1','T2','T3','T4','T5','T6','T7','T8','T9'),4),
                  rep=rep(c('R1','R2','R3','R4'), each=9),
                  larvae=c(9,4,6,9,27,35,1,10,4,
                           12,8,15,6,17,28,0,0,10,
                           0,5,6,4,10,2,0,2,15,
                           1,1,2,5,10,15,0,1,5))


gomez.nonnormal1 <- dat

# ----------------------------------------------------------------------------

dat <- gomez.nonnormal1

# Because some of the original values are less than 10,
# the transform used is log10(x+1) instead of log10(x).
dat <- transform(dat, loglarv=log10(larvae+1))

# Gomez table 7.16
m1 <- lm(loglarv ~ rep + trt, data=dat)
anova(m1)
