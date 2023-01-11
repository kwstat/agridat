# summerby.unif.R

# Reason not used:
# Structure is a bit odd with multiple crops in each year.

# Source: Summerby 1934.
# The value of preliminary uniformity trials in increasing the precision
# of field experiments.


libs(agridat,desplot,lattice,reshape2,rio)

dat <- import("c:/x/rpack/agridat/data-unused/summerby.unif.csv")

desplot(yield~plot*range|year, dat, tick=TRUE)

dat2 <- subset(dat, crop != "fodder")
desplot(yield~plot*year|crop, data=dat2)

dat3 <- dcast(dat, range+plot~year, value.var='yield', fun=mean)
splom(~dat3[,-c(1:2)]|dat3$range)
