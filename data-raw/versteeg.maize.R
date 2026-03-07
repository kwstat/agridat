libs(dplyr, readxl)

setwd("c:/drop/rpack/agridat/data-raw")
dat <- read_excel("versteeg.maize.xlsx")
head(dat)
versteeg.maize <- dat
kw::agex(versteeg.maize)


