# stickler.r
# Time-stamp: <13 Jan 2017 19:56:45 c:/x/rpack/agridat/data-done/stickler.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(tibble)


setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_csv("stickler1.csv", col_names=FALSE)
d2 <- read_csv("stickler2.csv", col_names=FALSE)
d3 <- read_csv("stickler3.csv", col_names=FALSE)
d4 <- read_csv("stickler4.csv", col_names=FALSE)

## levelplot(as.matrix(d1))
## levelplot(as.matrix(d2))
## levelplot(as.matrix(d3))
## levelplot(as.matrix(d4))

d1 <- as.matrix(d1)
d2 <- as.matrix(d2)
d3 <- as.matrix(d3)
d4 <- as.matrix(d4)

colnames(d1) <- colnames(d2) <- colnames(d3) <- colnames(d4) <- 1:20

d1 <- melt(d1)
d2 <- melt(d2)
d3 <- melt(d3)
d4 <- melt(d4)

names(d1) <- names(d2) <- names(d3) <- names(d4) <- c('row','col','yield')
d1 <- cbind(expt="E1",d1)
d2 <- cbind(expt="E2",d2)
d3 <- cbind(expt="E3",d3)
d4 <- cbind(expt="E4",d4)

stickler.sorghum.uniformity <- rbind(d1,d2,d3,d4)

# ----------------------------------------------------------------------------

dat <- stickler.sorghum.uniformity
dat1 <- subset(dat, expt=="E1")
dat2 <- subset(dat, expt!="E1")

desplot(yield ~ col*row|expt, data=dat1,
        #cex=1,text=yield, shorten="none",
        xlab="row",ylab="range",
        flip=TRUE, tick=TRUE, aspect=(20*10)/(20*14/12), # true aspect
        main="stickler.sorghum.uniformity: expt E1")
desplot(yield ~ col*row|expt, data=dat2,
        xlab="row",ylab="range",
        flip=TRUE, tick=TRUE, aspect=(20*5)/(20*44/12), # true aspect
        main="stickler.sorghum.uniformity: expt E2,E3,E4")

# Stickler, p. 10-11 has
#    E1    E2    E3    E4
# 34.81 11.53 11.97 14.10 
cv <- function(x) 100*sd(x)/mean(x)
tapply(dat$yield, dat$expt, cv)
# 35.74653 11.55062 11.97011 14.11389 
