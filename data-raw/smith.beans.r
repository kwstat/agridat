# smith.beans.r
# Time-stamp: c:/x/rpack/agridat/data-done/smith.beans.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
lib(reshape2)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- import("smith.beans.xlsx", sheet=1, col_names=FALSE)
dat2 <- import("smith.beans.xlsx", sheet=2, col_names=FALSE)
dat3 <- import("smith.beans.xlsx", sheet=3, col_names=FALSE)
dat4 <- import("smith.beans.xlsx", sheet=4, col_names=FALSE)

colnames(dat1) <- 1:ncol(dat1)
colnames(dat2) <- 1:ncol(dat2)
colnames(dat3) <- 1:ncol(dat3)
colnames(dat4) <- 1:ncol(dat4)

rownames(dat1) <- 1:nrow(dat1)
rownames(dat2) <- 1:nrow(dat2)
rownames(dat3) <- 1:nrow(dat3)
rownames(dat4) <- 1:nrow(dat4)

dat1 <- as.matrix(dat1)
dat2 <- as.matrix(dat2)
dat3 <- as.matrix(dat3)
dat4 <- as.matrix(dat4)

dat1 <- melt(dat1)
dat2 <- melt(dat2)
dat3 <- melt(dat3)
dat4 <- melt(dat4)

colnames(dat1) <- colnames(dat2) <- colnames(dat3) <- colnames(dat4) <- c('row','col','yield')

smith.beans1.uniformity <- dat1
smith.beans2.uniformity <- dat2
smith.beans3.uniformity <- dat3
smith.beans4.uniformity <- dat4

# ----------------------------------------------------------------------------

