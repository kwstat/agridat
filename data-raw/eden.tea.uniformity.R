# eden.tea.uniformity.R
# Time-stamp: <27 Mar 2018 22:01:44 c:/x/rpack/agridat/data-raw/eden.tea.uniformity.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_csv("eden.tea.uniformity.csv")
dat <- dat0
head(dat)
dat$row <- rep(12:1, 12)
dat$col <- rep(1:12, each=12)

tab <- acast(dat, row ~ col, value.var='yield')

eden.tea.uniformity <- dat

