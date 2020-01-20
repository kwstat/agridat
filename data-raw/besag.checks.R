# besag.checks.R
# Time-stamp: <08 Jan 2020 11:40:20 c:/x/rpack/agridat/data-raw/besag.checks.R>

setwd("c:/x/rpack/agridat/data-raw")
dat = read.csv("besag.checks.csv")

besag.checks <- dat
kw::agex(besag.checks)
# ----------------------------------------------------------------------------

libs(desplot)
desplot(yield~col*row,dat,
        num=gen, aspect=234/46.5, # true aspect
        main="besag.checks")

# Variety Bounty is 10% higher
sapply(split(dat$yield, dat$gen), mean)
