# linder.wheat.R

libs(dplyr,readxl,reshape2,tidyverse)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_excel("linder.wheat.xlsx",1)
d1 <- melt(d1)
names(d1) <- c('env','rep','gen','yield')
linder.wheat <- d1
