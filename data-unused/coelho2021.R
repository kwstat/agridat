
# Reason not used: ?

# Coelho et al 2021
# Accounting for spatial trends in multi-environment diallel analysis in maize breeding
# https://doi.org/10.1371/journal.pone.0258473

# Mildly interesting data that has spatial coordinates for a diallel at 4 locs.
# The paper shows no heatmaps!

setwd("c:/drop/rpack/agridat/data-raw")
dat <- read.csv("coelho.maize.diallel.txt", sep="\t")
head(dat)
# 4 trials, 3 rep, 12 parents, 79 hyb offspring

libs(desplot)
desplot(dat, GY ~ Columns*Rows|Trials, out1=Replications)
