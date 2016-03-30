# draper.r
# Time-stamp: <29 Mar 2016 22:53:42 c:/x/rpack/agridat/data-raw/draper.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")
dat5 <- import("draper.safflower.xlsx",sheet=1, col_names=FALSE)
dat4 <- import("draper.safflower.xlsx",sheet=2, col_names=FALSE)

colnames(dat5) <- 1:15
colnames(dat4) <- 1:17

library(reshape2)
dat5 <- melt(as.matrix(dat5))
dat4 <- melt(as.matrix(dat4))
names(dat4) <- names(dat5) <- c('row','col','yield')

draper.safflower.uniformity <- rbind(
  cbind(expt="E5",dat5),
  cbind(expt="E4",dat4))

# ----------------------------------------------------------------------------
