# devries.pine.R

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("devries.pine.xlsx")
dat <- dat0
devries.pine <- dat
