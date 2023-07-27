# kalamkar.wheat.r
# Time-stamp: <12 Jul 2023 16:51:37 c:/drop/rpack/agridat/data-raw/kalamkar.wheat.uniformity.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(tibble)


setwd("c:/x/rpack/agridat/data-done/")

dat0 <- read_excel("kalamkar.wheat.yield.xlsx",col_names=FALSE)
dat0 <- as.matrix(dat0)
colnames(dat0) <- 1:16
dat0 <- melt(dat0)
names(dat0) <- c('row','col','yield')
dat0 <- subset(dat0, !is.na(yield))

dat1 <- read_excel("kalamkar.wheat.ears.xlsx",col_names=FALSE)
dat1 <- as.matrix(dat1)
colnames(dat1) <- 1:16
dat1 <- melt(dat1)
names(dat1) <- c('row','col','ears')
dat1 <- subset(dat1, !is.na(ears))

inner_join(dat0, dat1, by=c('row','col')) -> dat

kalamkar.wheat.uniformity <- dat





