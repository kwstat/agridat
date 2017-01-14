# sharma.met.r
# Time-stamp: c:/x/rpack/agridat2/sharma.met.r

# Simulated data to illustrate Finlay-Wilkinson computation

library(asreml)
library(kw)
library(Hmisc)
library(lattice)

setwd("c:/x/rpack/agridat2/")
dat <- import("sharma.met.xlsx")
str(dat)
dat <- transform(dat, gen=factor(gen), loc=factor(loc),
                 year=factor(year), rep=factor(rep))

Table 8.1 (p 82), table 9.1 (p 95)

dat <- transform(dat, env=paste0(loc,year))
mat <- acast(dat, gen~env, value.var='yield', fun=mean)

lib(kw)
m1 <- fw(yield ~ gen*env, dat)
plot(m1)
