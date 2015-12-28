# polson.safflower.r
# Time-stamp: c:/x/rpack/agridat/data-done/polson.safflower.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- import("polson.safflower.xlsx",sheet=1, col_names=FALSE)
dat2 <- import("polson.safflower.xlsx",sheet=2, col_names=FALSE)
dat3 <- import("polson.safflower.xlsx",sheet=3, col_names=FALSE)
dat4 <- import("polson.safflower.xlsx",sheet=4, col_names=FALSE)

dat <- cbind(dat1[,2:14],dat2[,2:14],dat3[,2:14],dat4[,2:14])
image(as.matrix(dat))
lib(reshape2)
dat <- as.matrix(dat)
rownames(dat) <- 1:33
colnames(dat) <- 1:52
dat <- melt(dat)
names(dat) <- c('row','col','yield')
polson.safflower <- dat
# ----------------------------------------------------------------------------

data(polson.safflower)
dat <- polson.safflower

library(desplot)
desplot(yield ~ col*row, data=dat, main="polson.safflower",
        flip=TRUE, tick=TRUE)

if(require(agricolae) & require(reshape2)){
  dmat <- acast(dat, row~col, value.var="yield")
  # Similar to Polson fig 4.
  tab <- index.smith(dmat, col="red")$uniformity
  # Polson p. 25 said CV decreased from 14.3 to 4.5
  # for increase from 1 unit to 90 units.  Close match.
  tab <- data.frame(tab)

  # Polson only uses log(Size) < 2 in his Fig 5, obtained slope -0.63
  coef(lm(log(Vx) ~ log(Size), subset(tab, Size <= 6))) # -0.70

  # Polson table 2 reported labor for
  # K1, number of plots, 133 hours 75%
  # K2, size of plot, 43.5 hours 24%
  # Optimum plot size
  # X = b K1 / ((1-b) K2)
  # Polson suggests optimum plot size 2.75 to 11 basic plots
  
}
