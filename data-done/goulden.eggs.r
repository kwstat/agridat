# goulden.eggs.r
# Time-stamp: <27 Apr 2016 14:32:11 c:/x/rpack/agridat/data-done/goulden.eggs.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat <- import("goulden.eggs.csv")
dat$V1 <- NULL
rownames(dat) <- 1:24
lib(reshape2)
dat <- melt(as.matrix(dat))
colnames(dat) <- c('day','v','weight')
dat <- dat %>% arrange(day)
dat <- dat[,c('day','weight')]
goulden.eggs <- dat

# ----------------------------------------------------------------------------

dat <- goulden.eggs

if(require(qicharts)){
  # Figure 19-4 of Goulden. (Goulden uses 1/n when calculating std dev)
  op <- par(mfrow=c(2,1))
  qic(weight, x = day, data = dat, chart = 'xbar',
      main = 'Average egg weight (Xbar chart)',
      xlab = 'Date', ylab = 'Weight' )
  qic(weight, x = day, data = dat, chart = 's',
      main = 'Std dev egg weight (S chart)',
      xlab = 'Date', ylab = 'Weight' )
  par(op)
}

