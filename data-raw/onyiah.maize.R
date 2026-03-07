# onyiah.maize.R

libs(readxl)

setwd("c:/drop/rpack/agridat/data-raw")
dat <- read_excel("onyiah.maize.xlsx")
head(dat)

onyiah.maize <- dat
kw::agex(onyiah.maize)



