# mcclelland.corn.r
# Time-stamp: <12 Jan 2017 14:24:37 c:/x/rpack/agridat/data-done/mcclelland.corn.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(tibble)


setwd("c:/x/rpack/agridat/data-done/")
lib(rio)

dat <- import("mcclelland.corn.csv", header=FALSE,fill=TRUE)
dat <- as.matrix(dat)
# Now we need to stack pairs of columns on top of each other
dat <- rbind(dat[,1:2],dat[,3:4],dat[,5:6],dat[,7:8])
colnames(dat) <- 1:2
rownames(dat) <- 1:nrow(dat)
dat <- melt(dat)
names(dat) <- c('row','col','yield')
dat <- subset(dat, !is.na(yield))

mcclelland.corn.uniformity <- dat
# ----------------------------------------------------------------------------

dat <- mcclelland.corn.uniformity

cv(dat$yield) # 16.55

mean(dat$yield) # 13.74
IQR(dat$yield) # 2.6
0.5 * IQR(dat$yield) # 1.3 = probable error
0.5 * IQR(dat$yield)/mean(dat$yield)  # 9.5%


dd <- subset(dat, row <= 216)
0.5 * IQR(dd$yield)/mean(dd$yield)  # 9.5%
