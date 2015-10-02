# lord.rice.uniformity.r
# Time-stamp: c:/x/rpack/agridat2/lord.rice.uniformity.r

# Lord 1931.
# A uniformity trial with irrigated broadcast rice

# Layout is not contiguous, a bit confusing as well.

library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-unused/")
dat <- import("lord.rice.uniformity.csv")
str(dat)
gr <- dat[(1:112)*2 - 1,]
rownames(gr) <- 1:112
colnames(gr) <-
st <- dat[(1:112)*2,]
rownames(st) <- 1:112
