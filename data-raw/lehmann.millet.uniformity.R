# lehmann.millet.uniformity.R
# Time-stamp: <18 Sep 2018 15:41:10 c:/x/rpack/agridat/data-done/lehmann.millet.uniformity.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- read_csv("lehmann.millet.uniformity.csv")
dat <- dat0
dat <- filter(dat, !is.na(year))
head(dat)

