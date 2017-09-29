# montgomery.R
# Time-stamp: <29 Sep 2017 08:22:10 c:/x/rpack/agridat/data-raw/montgomery.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("montgomery1911.xlsx", col_names=FALSE)
dat <- as.matrix(dat0)
colnames(dat) <- 1:14
rownames(dat) <- 16:1
levelplot(t(dat))
dat <- melt(dat)
names(dat) <- c('row','col','yield')
dat <- cbind(year=1911, dat)
mont11 <- dat

data(montgomery.wheat.uniformity, package="agridat")
mont09 <- montgomery.wheat.uniformity
names(mont09) <- c('col','row','yield')
mont09 <- cbind(year=1909, mont09)
mont09$col <- rep(1:14,16)
lib(desplot)
desplot(yield ~ col*row, data=mont09, tick=TRUE,text=yield)
desplot(yield ~ col*row, data=mont11, tick=TRUE, text=yield)

montgomery.wheat.uniformity <- rbind(mont09,mont11)

