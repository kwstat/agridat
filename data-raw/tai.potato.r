# tai.potato.r
# Time-stamp: c:/x/rpack/agridat/data-raw/tai.potato.r

# Source
  George C. C. Tai (1971).
Genotypic Stability Analysis and Its Application to Potato Regional Trials.


library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- rio::import("tai.potato.xlsx", sheet=1)

dat <- dat0

str(dat)
Hmisc::describe(dat)

tai.potato <- dat
