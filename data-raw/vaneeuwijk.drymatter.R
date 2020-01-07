# vaneeuwijk.drymatter.r
# Time-stamp: <14 Apr 2017 14:22:44 c:/x/rpack/agridat/data-raw/vaneeuwijk.drymatter.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_csv("vaneeuwijk.drymatter.csv")
dat <- melt(dat, id.vars=c('year','site'))
names(dat) <- c('year','site','variety','y')

vaneeuwijk.drymatter <- dat

# ----------------------------------------------------------------------------

dat <- vaneeuwijk.drymatter
dat <- transform(dat, year=factor(year))
dat <- transform(dat, env=factor(paste(year,site)))
m1 <- aov(y ~ variety+env+variety:env, data=dat)
anova(m1) # Similar to VanEeuwijk table 2

# this does not look similar to VanEeuwijk fig 3
require(gge)
m2 <- gge(y ~ variety*env, dat)
biplot(m2)

m3 <- gge(y ~ env*variety, dat)
