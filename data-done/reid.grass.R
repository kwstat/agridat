# reid.grass.R
# Time-stamp: <01 Oct 2017 11:42:48 c:/x/rpack/agridat/data-raw/reid.grass.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("reid.grass.xlsx")

reid.grasses <- dat

# ----------------------------------------------------------------------------
# keep

library(nlme)
dat2 <- dat
dat2$indiv <- paste(dat$year, dat$gen) # individual year+genotype curves

# use all data to get initial values
inits <- getInitial(drymatter ~ SSfpl(nitro, A, B, xmid, scal), data = dat2)
inits
##         A          B       xmid       scal 
## -4.167902  12.139796  68.764796 128.313106 
xvals <- 0:800
y1 <- with(as.list(inits), SSfpl(xvals, A, B, xmid, scal))
plot(drymatter ~ nitro, dat2)
lines(xvals,y1)

# must have groupedData object to use augPred
dat2 <- groupedData(drymatter ~ nitro|indiv, data=dat2)
plot(dat2)

# without 'random', all effects are included in 'random'
m1 <- nlme(drymatter ~ SSfpl(nitro, A, B, xmid,scale),
           data= dat3,
           fixed= A + B + xmid + scale ~ 1,
           # random = B ~ 1|indiv, # to make only B random
           random = A + B + xmid + scale ~ 1|indiv,
           start=inits)
fixef(m1)
summary(m1)
plot(augPred(m1, level=0:1)) # only works with groupedData object
