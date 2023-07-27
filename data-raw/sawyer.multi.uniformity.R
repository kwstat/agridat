# rothamsted.sawyer.r
# Time-stamp: c:/x/rpack/agridat/data-done/rothamsted.sawyer.r

library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- import("rothamsted.sawyer.xlsx", sheet=1, col_names=FALSE)
dat2 <- import("rothamsted.sawyer.xlsx", sheet=2, col_names=FALSE)
dat3 <- import("rothamsted.sawyer.xlsx", sheet=3, col_names=FALSE)
dat4 <- import("rothamsted.sawyer.xlsx", sheet=4, col_names=FALSE)
dat5 <- import("rothamsted.sawyer.xlsx", sheet=5, col_names=FALSE)

colnames(dat1) <- 1:ncol(dat1)
colnames(dat2) <- 1:ncol(dat2)
colnames(dat3) <- 1:ncol(dat3)
colnames(dat4) <- 1:ncol(dat4)
colnames(dat5) <- 1:ncol(dat5)

lib(reshape2)

dat1 <- melt(as.matrix(dat1))
dat2 <- melt(as.matrix(dat2))
dat3 <- melt(as.matrix(dat3))
dat4 <- melt(as.matrix(dat4))
dat5 <- melt(as.matrix(dat5))

colnames(dat1) <- c('row','col','grain')
colnames(dat2) <- c('row','col','straw')
colnames(dat3) <- c('row','col','leafwt')
colnames(dat4) <- c('row','col','rootwt')
colnames(dat5) <- c('row','col','rootct')

dat <- Reduce(function(...) merge(...), list(dat1, dat2, dat3, dat4, dat5))
# ----------------------------------------------------------------------------

sawyer.multi.uniformity <- dat

