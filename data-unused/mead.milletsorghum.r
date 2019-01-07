# mead.milletsorghum.R

# Source: Mead, "Statistical Methods in Agriculture".
# Possible original sources:

# Gilliver 1983
# A Graphical Assessment of Data from Intercropping Factorial Experiments
# http://journals.cambridge.org/action/displayAbstract?fromPage=online&aid=1613616

# S. C. Pearce and B. Gilliver (1978).
# The statistical analysis of data from intercropping experiments.
# The Journal of Agricultural Science, 91, pp 625-632. doi:10.1017/S0021859600060007.
# http://journals.cambridge.org/action/displayAbstract;jsessionid=D505978E6C332EF8F57B99D7159FB6DE.journals?fromPage=online&aid=4772728

# Why is this data unused?

library(asreml)
library(kw)
library(Hmisc)
library(lattice)


setwd("c:/x/rpack/agridat/data-unused/")
dat <- import("mead.milletsorghum.csv")
str(dat)
describe(dat)

d2 <- melt(dat)
d2 <- dcast(d2, block+variety~crop, value.var='value')
with(d2, xyplot(sorghum~millet, xlim=c(0,4), ylim=c(0,5)))
aggregate(yield~block+crop, data=dat, FUN=sum)

d2mn <- aggregate(yield~variety+crop, data=dat, FUN=mean)
d2mn <- dcast(d2mn, variety~crop, value.var='yield')
with(d2mn, xyplot(sorghum~millet, xlim=c(0,4), ylim=c(0,5)))
