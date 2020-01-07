# iyer.wheat.r
# Time-stamp: <19 Jun 2017 14:50:34 c:/x/rpack/agridat/data-done/iyer.wheat.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

setwd("c:/x/rpack/agridat/data-done/")

# OCR did not work well on the low-quality scans of this paper
# Sheet 3 was double-keyed (typed twice), with about 1%
# of the 500 entries to be wrong, all in the second keying.
# mean(dat3)           # 16.349   # iyer reported 16.066
# var(as.vector(dat3)) # 8.614    # iyer reported 8.675
# since the double-keyed numbers still did not match the mean
# and variance of Iyer Table 1, I did not double-check sheet 1, 2 or 4.

dat1 <- read_excel("iyer.wheat.xlsx",sheet=1, col_names=FALSE)
dat2 <- read_excel("iyer.wheat.xlsx",sheet=2, col_names=FALSE)
dat3 <- read_excel("iyer.wheat.xlsx",sheet=3, col_names=FALSE)
dat4 <- read_excel("iyer.wheat.xlsx",sheet=4, col_names=FALSE)
dat1 <- as.matrix(dat1)
dat2 <- as.matrix(dat2)/10
dat3 <- as.matrix(dat3)/10
dat4 <- as.matrix(dat4)/10
colnames(dat1) <- 1:20
colnames(dat2) <- 21:40
colnames(dat3) <- 41:60
colnames(dat4) <- 61:80
dat <- cbind(cbind(dat1,dat2), cbind(dat3,dat4))
rownames(dat) <- 25:1
dat <- melt(dat)
names(dat) <- c('row','col','yield')


# check last digits
table(dat$yield - floor(dat$yield))
lastdig <- dat$yield - floor(dat$yield)

histogram(dat$yield)

# write.table(iyer.wheat.uniformity, file="c:/x/rpack/agridat/data/iyer.wheat.uniformity.txt", sep="\t", row.names=FALSE)
