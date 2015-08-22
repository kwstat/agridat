# montgomery.wheat.r
# Time-stamp: c:/x/rpack/agridat2/montgomery.wheat.r

library(lattice)
library(rio)

# Data comes from:
# Montgomery, "A method of correcting for soil heterogeneity"

setwd("c:/x/rpack/agridat2/unused/")
dat0 <- import("montgomery.wheat.csv", head=FALSE)
dat <- as.matrix(dat0)
rownames(dat) <- 14:1
colnames(dat) <- 1:16
dat <- melt(dat)
names(dat) <- c('row','col','yield')

library(agridat)
desplot(yield ~ col*row, dat)

# This should be simple!  Just use contingency-table estimates to calculate
# the probable value.  Alas, I can't match the paper!

rs <- rowSums(dat0)
cs <- colSums(dat0)
tot <- sum(dat0)
round(outer(rs,cs)/tot,0)

