# tai.potato.r
# Time-stamp: c:/x/rpack/agridat/data-raw/tai.potato.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- import("tai.potato.xlsx", sheet=1)

dat <- dat0

str(dat)
describe(dat)

tai.potato <- dat
