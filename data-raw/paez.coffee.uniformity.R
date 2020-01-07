# paez.coffee.uniformity.R

libs(desplot,dplyr,lattice,readxl,reshape2)
dat <- read_excel("c:/x/rpack/agridat/data-raw/paez.coffee.uniformity.xlsx")

dat[,4:8] <- dat[,4:8]/10 # I did not type the decimal character


