# sharma.met.r

# Simulated data to illustrate Finlay-Wilkinson computation.

pacman::p_load( rio, reshape2)

setwd("c:/one/rpack/agridat/data-raw/")
dat <- import("sharma.met.xlsx")
head(dat)
str(dat)

sharma.met <- dat
agex(sharma.met)
