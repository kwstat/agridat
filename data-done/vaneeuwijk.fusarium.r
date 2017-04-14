# vaneeuwijk.fusarium.r
# Time-stamp: <14 Apr 2017 15:56:12 c:/x/rpack/agridat/data-raw/vaneeuwijk.fusarium.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_csv("vaneeuwijk.fusarium.csv")
dat <- melt(dat, id.vars=c('year','strain'))
names(dat) <- c('year','strain','gen','y')

vaneeuwijk.fusarium <- dat

# ----------------------------------------------------------------------------

dat <- vaneeuwijk.fusarium
dat <- transform(dat, year=factor(year))
dat <- transform(dat, logity=log((y/100)/(1-y/100)))
if(require(HH)){
  position(dat$year) <- c(3,9,14,19)
  position(dat$strain) <- c(2,5,8,11,14,17,20)
  HH::interaction2wt(logit(y ~ gen+year+strain,dat,rot=c(90,0),
                     main="vaneeuwijk.fusarium")
}

# anova on logit scale. Near match to VanEeuwijk table 6
  m1 <- aov(logity ~ gen*strain*year, data=dat)
anova(m1) # Similar to VanEeuwijk table 2

# this does not look similar to VanEeuwijk fig 3
require(gge)
m2 <- gge(y ~ variety*env, dat)
biplot(m2)

