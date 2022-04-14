
setwd("c:/one/rpack/agridat/data-raw")
dat <- read.csv("bachmaier2009.csv")
bachmaier.nitrogen <- dat
kw::agex(bachmaier.nitrogen)
