# christidis.cotton.R
# Time-stamp: <07 Jan 2018 21:42:12 c:/x/rpack/agridat/data-raw/christidis.cotton.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

setwd("c:/x/rpack/agridat/data-raw/")

dat1 <- read_excel("christidis.cotton.xlsx","Sheet1",col_names=FALSE)
dat2 <- read_excel("christidis.cotton.xlsx","Sheet2",col_names=FALSE)
dat3 <- read_excel("christidis.cotton.xlsx","Sheet3",col_names=FALSE)
dat4 <- read_excel("christidis.cotton.xlsx","Sheet4",col_names=FALSE)

dat1 %>% as.matrix -> dat1
colnames(dat1) <- 1:16
dat1 %>% melt %>% rename(col=Var1,row=Var2,yield=value) -> dat1
ht(dat1)
dat1$block="B1"

dat2 %>% as.matrix -> dat2
colnames(dat2) <- 1:16
dat2 %>% melt %>% rename(col=Var1,row=Var2,yield=value) -> dat2
ht(dat2)
dat2$block="B2"

dat3 %>% as.matrix -> dat3
colnames(dat3) <- 1:16
dat3 %>% melt %>% rename(col=Var1,row=Var2,yield=value) -> dat3
ht(dat3)
dat3$block="B3"

dat4 %>% as.matrix -> dat4
colnames(dat4) <- 1:16
dat4 %>% melt %>% rename(col=Var1,row=Var2,yield=value) -> dat4
ht(dat4)
dat4$block="B4"

dat <- rbind(dat1,dat2,dat3,dat4)

christidis.cotton.uniformity <- dat

# ----------------------------------------------------------------------------

dat <- christidis.cotton.uniformity
if(require(desplot)){
  dat$yld <- dat$yield/4*1000
  desplot(yld ~ col*row|block, data=dat,
          flip=TRUE, tick=TRUE, aspect=.25,
          main="christidis.cotton.uniformity")
}

# Match the mean yields in table 2
sapply(split(dat$yield, dat$block), mean)*16

contourplot(yld ~ col*row|block, data=dat,
            region=TRUE, as.table=TRUE, cuts=5,
            aspect=.25)

# ----------------------------------------------------------------------------
