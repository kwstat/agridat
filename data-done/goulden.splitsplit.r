# goulden.splitsplit.r
# Time-stamp: <01 May 2016 09:41:12 c:/x/rpack/agridat/data-done/goulden.splitsplit.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- import("goulden.splitsplit.xlsx",sheet=1, col_names=FALSE)
dat2 <- import("goulden.splitsplit.xlsx",sheet=2, col_names=FALSE)
dat3 <- import("goulden.splitsplit.xlsx",sheet=3, col_names=FALSE)
dat4 <- import("goulden.splitsplit.xlsx",sheet=4, col_names=FALSE)
dat1 <- as.matrix(dat1)
dat2 <- as.matrix(dat2)
dat3 <- as.matrix(dat3)
dat4 <- as.matrix(dat4)
colnames(dat1) <- colnames(dat2) <- colnames(dat3) <- colnames(dat4) <- 1:20
lib(reshape2)
dat1 <- melt(dat1)
dat2 <- melt(dat2)
dat3 <- melt(dat3)
dat4 <- melt(dat4)
names(dat1) <- c('row','col','yield')
names(dat2) <- c('row','col','inoc')
names(dat3) <- c('row','col','trt')
names(dat4) <- c('row','col','gen')
dat <- merge(merge(merge(dat1,dat2),dat3),dat4)
dat$dry <- lookup(dat$trt, c(1,3,5,7,9,2,4,6,8,10),
                  c('Dry','Dry','Dry','Dry','Dry','Wet','Wet','Wet','Wet','Wet'))
dat$dust <- lookup(dat$trt, c(1,2,3,4,5,6,7,8,9,10),
                   c('Ceresan','Ceresan','Semesan','Semesan','DuBay','DuBay','Check','Check','CaCO3','CaCO3'))
dat$inoc <- lookup(dat$inoc, c('i','u'), c('Inoc','Uninoc'))
dat$block <- lookup(dat$row, c(1,2,3,4,5,6,7,8),
                    c('B1','B1','B2','B2','B3','B3','B4','B4'))
dat$inoc <- factor(dat$inoc)
