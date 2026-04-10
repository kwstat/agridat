# bose.multi.R
# Time-stamp: <2026-04-10 14:06:05 wrightkevi>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat1 <- read_excel("hernandezdavila.potato.uniformity.xlsx","Sheet1", col_names=FALSE)
dat2 <- read_excel("hernandezdavila.potato.uniformity.xlsx","Sheet2", col_names=FALSE)


dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(expt="E1")
dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(expt="E2")

dat <- rbind(dat1,dat2)

hernandezdavila.potato.uniformity <- dat
kw::agex(hernandezdavila.potato.uniformity)

# ----------------------------------------------------------------------------

dat <- hernandezdavila.potato.uniformity

desplot(dat, yield ~ col*row, subset=expt=="E1",
          tick=TRUE, flip=TRUE, aspect=(42*0.9)/(12*0.9),
          main="hernandezdavila.potato.uniformity - Expt E1")
desplot(dat, yield ~ col*row, subset=expt=="E2",
          tick=TRUE, flip=TRUE, aspect=(42*0.9)/(12*0.9),
          main="hernandezdavila.potato.uniformity - Expt E2")


# Match the mean and sd in the source.
dat |> group_by(expt) |> summarize(mn=mean(yield), sd=sd(yield))
