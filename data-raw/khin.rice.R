# khin.rice.r
# Time-stamp: <16 Jun 2017 10:42:55 c:/x/rpack/agridat/data-done/khin.rice.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-done/")
dat <- read_csv("khin.rice.csv", col_names=FALSE)
max(dat)
dat <- as.matrix(dat)
image(as.matrix(dat))
colnames(dat) <- 1:30
dat <- melt(dat) 
names(dat) <- c('row','col','yield')

# check the fractional part of yields
histogram(dat$yield-floor(dat$yield))
