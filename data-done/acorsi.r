# acorsi.r
# Time-stamp: <27 Feb 2017 20:16:04 c:/x/rpack/agridat/data-done/acorsi.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)
library(magrittr)

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_csv("acorsi.greyleafspot.csv")
dat %<>% mutate(gen=factor(gen),env=factor(env),rep=factor(rep))

acorsi.grayleafspot <- dat
# ----------------------------------------------------------------------------

dat <- acorsi.grayleafspot
# acorsi figure 2
op <- par(mfrow=c(2,1), mar=c(5,4,3,2))
boxplot(y ~ env, dat, xlab="environment", las=2)
boxplot(y ~ gen, dat, xlab="genotype", las=2)
par(op)

