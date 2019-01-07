# sharma.mutation1.R

# Source: Biometry book by Sharma

# Why is this unused?

library(asreml)
library(kw)
library(Hmisc)
library(lattice)

setwd("c:/x/rpack/agridat2/")
dat <- import("sharma.mutation1.csv")

xyplot(mortality ~ dose | gen, data=dat, group=rep, layout=c(1,3))
