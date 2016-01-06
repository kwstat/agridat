# sharma.mutation1.r
# Time-stamp: c:/x/rpack/agridat2/sharma.mutation1.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)

setwd("c:/x/rpack/agridat2/")
dat <- import("sharma.mutation1.csv")

xyplot(mortality ~ dose | gen, data=dat, group=rep, layout=c(1,3))
