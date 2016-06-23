# christidis.r
# Time-stamp: <17 May 2016 17:45:05 c:/x/rpack/agridat/data-done/christidis.r>



library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat <- import("christidis.wheat.uniformity.xlsx", sheet=1,col_names=FALSE)
dat <- as.matrix(dat)
colnames(dat) <- 1:12
lib(reshape2)
dat <- melt(dat)
names(dat) <- c('row','col','yield')

christidis.wheat.uniformity <- dat

