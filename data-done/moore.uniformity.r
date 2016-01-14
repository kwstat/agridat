# moore.uniformity.r
# Time-stamp: c:/x/rpack/agridat/data-done/moore.uniformity.r



library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- import("moore.uniformity.xlsx", sheet=1, col_names=FALSE)
dat2 <- import("moore.uniformity.xlsx", sheet=2, col_names=FALSE)
dat3 <- import("moore.uniformity.xlsx", sheet=3, col_names=FALSE)
dat4 <- import("moore.uniformity.xlsx", sheet=4, col_names=FALSE)
dat5 <- import("moore.uniformity.xlsx", sheet=5, col_names=FALSE)
dat6 <- import("moore.uniformity.xlsx", sheet=6, col_names=FALSE)
dat7 <- import("moore.uniformity.xlsx", sheet=7, col_names=FALSE)
dat8 <- import("moore.uniformity.xlsx", sheet=8, col_names=FALSE)
dat9 <- import("moore.uniformity.xlsx", sheet=9, col_names=FALSE)

dat1 <- dat1[,-1]
dat2 <- dat2[,-1]
dat3 <- dat3[,-1]
dat4 <- dat4[,-1]
dat5 <- dat5[,-1]
dat6 <- dat6[,-1]
dat7 <- dat7[,-1]
dat8 <- dat8[,-1]
dat9 <- dat9[,-1]

colnames(dat1) <- 1:ncol(dat1)
colnames(dat2) <- 1:ncol(dat2)
colnames(dat3) <- 1:ncol(dat3)
colnames(dat4) <- 1:ncol(dat4)
colnames(dat5) <- 1:ncol(dat5)
colnames(dat6) <- 1:ncol(dat6)
colnames(dat7) <- 1:ncol(dat7)
colnames(dat8) <- 1:ncol(dat8)
colnames(dat9) <- 1:ncol(dat9)

lib(reshape2)

dat1 <- melt(as.matrix(dat1))
dat2 <- melt(as.matrix(dat2))
dat3 <- melt(as.matrix(dat3))
dat4 <- melt(as.matrix(dat4))
dat5 <- melt(as.matrix(dat5))
dat6 <- melt(as.matrix(dat6))
dat7 <- melt(as.matrix(dat7))
dat8 <- melt(as.matrix(dat8))
dat9 <- melt(as.matrix(dat9))

colnames(dat1) <- c('row','col','yield')
colnames(dat2) <- c('row','col','yield')
colnames(dat3) <- c('row','col','yield')
colnames(dat4) <- c('row','col','ears')
colnames(dat5) <- c('row','col','yield')
colnames(dat6) <- c('row','col','yield')
colnames(dat7) <- c('row','col','heads')
colnames(dat8) <- c('row','col','yield')
colnames(dat9) <- c('row','col','heads')

#dat <- Reduce(function(...) merge(...), list(dat1, dat2, dat3, dat4, dat5))

lib(desplot)

# ----------------------------------------------------------------------------

moore.polebean.uniformity <- dat1
moore.bushbean.uniformity <- dat2
moore.sweetcorn.uniformity <- merge(dat3,dat4)
moore.carrots.uniformity <- dat5
moore.springcauliflower.uniformity <- merge(dat6,dat7)
moore.fallcauliflower.uniformity <- merge(dat8,dat9)

# ----------------------------------------------------------------------------

dat1$trt <- sample(letters[1:6], size=144, replace=TRUE)
m1 <- aov(yield ~ trt, dat1)
anova(m1)
sd(dat1$yield)
# ----------------------------------------------------------------------------

cv(dat1$yield)
cv(dat2$yield)
