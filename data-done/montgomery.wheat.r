# montgomery.wheat.r
# Time-stamp: c:/x/rpack/agridat2/montgomery.wheat.r

# Surface & Pearl, 1916
# A method of correcting for soil heterogeneity in variety tests
# Figure 2.

# The above paper cites the source as Montgomery 1913
# Experiments in wheat breeding
# Figure 10.

library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- import("montgomery.wheat.csv", head=FALSE)
dat0 <- as.matrix(dat0)
dat <- dat0
rownames(dat) <- 14:1
colnames(dat) <- 1:16
dat <- melt(dat)
names(dat) <- c('row','col','yield')

montgomery.wheat <- dat
# agex(montgomery.wheat)

# ----------------------------------------------------------------------------

library(agridat)
dat <- montgomery.wheat
desplot(yield ~ col*row, dat, text=yield,
        cex=1, shorten="none",
        main="montgomery.wheat - observed yield")

mean(dat0) # 681 match on page 1044
# Calculated yield
rs <- rowSums(dat0)
cs <- colSums(dat0)
tot <- sum(dat0)
mn <- mean(dat0)
dev0 <- round(outer(rs,cs)/tot,0) - mn
round(dat0 - dev0,0)

m1 <- lm(yield ~ factor(col) + factor(row), data=dat)
predict(m1)-mn

# alternate, equivalent
dat$yield - (predict(m1)-mn)
