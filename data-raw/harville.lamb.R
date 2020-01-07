# harville.lamb.R
# Time-stamp: <10 Nov 2017 12:54:36 c:/x/rpack/agridat/data-done/harville.lamb.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-done/")
dat0 <- read_csv("harville.lamb.csv")
dat <- dat0
head(dat)

harville.lamb <- dat



