# nonnecke.r
# Time-stamp: c:/x/rpack/agridat/data-done/nonnecke.r



library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")

dat <- import("nonnecke.xlsx",sheet=1,col_names=FALSE)
dat <- import("nonnecke.xlsx",sheet=2,col_names=FALSE)
dat <- import("nonnecke.xlsx",sheet=3,col_names=FALSE)


nonnecke.corn1.uniformity <- dat1
nonnecke.corn2.uniformity <- dat2
nonnecke.corn3.uniformity <- dat3

dat <- nonnecke.corn1.uniformity
dat <- nonnecke.corn2.uniformity
dat <- nonnecke.corn3.uniformity

sd(dat)/mean(dat)

# ----------------------------------------------------------------------------

dat1 <- import("nonnecke.xlsx",sheet=4,col_names=FALSE)
dat2 <- import("nonnecke.xlsx",sheet=5,col_names=FALSE)

dat3 <- import("nonnecke.xlsx",sheet=6,col_names=FALSE)
dat4 <- import("nonnecke.xlsx",sheet=7,col_names=FALSE)

dat1 <- as.matrix(dat1[,-1])
colnames(dat1) <- 1:ncol(dat1)
dat1 <- melt(dat1)
colnames(dat1) <- c('row','col','yield')

dat2 <- as.matrix(dat2[,-1])
colnames(dat2) <- 1:ncol(dat2)
dat2 <- melt(dat2)
colnames(dat2) <- c('row','col','yield')

dat12 <- merge(dat1,dat2,by=c('row','col'))
colnames(dat12) <- c('row','col','vines','peas')

dat3 <- as.matrix(dat3[,-1])
colnames(dat3) <- 1:ncol(dat3)
dat3 <- melt(dat3)
colnames(dat3) <- c('row','col','yield')

dat4 <- as.matrix(dat4[,-1])
colnames(dat4) <- 1:ncol(dat4)
dat4 <- melt(dat4)
colnames(dat4) <- c('row','col','yield')

dat34 <- merge(dat3,dat4,by=c('row','col'))
colnames(dat34) <- c('row','col','vines','peas')

dat12 <- cbind(block="B1",dat12)
dat34 <- cbind(block="B2",dat34)

dat <- rbind(dat12,dat34)


nonnecke.peas.uniformity <- dat
# ----------------------------------------------------------------------------
dat <- nonnecke.peas.uniformity
