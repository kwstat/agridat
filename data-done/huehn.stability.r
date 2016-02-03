# huehn.stability.r
# Time-stamp: c:/x/rpack/agridat/data-done/huehn.stability.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- import("huehn.stability.xlsx", sheet=1, col_names=FALSE)

dat <- dat0[ , c(1,2,4,6,8,10,12,14,16,18,20,22)]

rownames(dat) <- dat$X0
dat$X0 <- NULL
dat$X21 <- NULL # gen means
dat <- as.matrix(dat)
colnames(dat) <- paste0('E',pad(1:10))

huehn.stability <- melt(dat)
names(huehn.stability) <- c('gen','env','yield')


