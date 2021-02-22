# petersen.sorghum.cowpea.R
# Time-stamp: <22 Feb 2021 11:51:24 c:/x/rpack/agridat/data-raw/petersen.sorghum.cowpea.R>

library(pacman)
p_load(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("petersen.sorghum.cowpea.xlsx")
dat <- janitor::clean_names(dat0)
dat <- mutate_at(dat, vars(block), factor)
head(dat)

petersen.sorghum.cowpea <- dat


dat <- petersen.sorghum.cowpea

# Petersen figure 10.4a
tmp <- dat %>% group_by(srows,crows) %>% summarize(syield=mean(syield), cyield=mean(cyield))

with(tmp, plot(srows, syield + cyield,
               col="blue", type='l', xlim=c(0,5), ylim=c(0,4000)) )
with(tmp, lines(srows, syield) )
with(tmp, lines(srows, cyield, col="red") )
title("Cow Pea (red), Sorghum (black), Total (blue)")
title("petersen.sorghum.cowpea", line=0.5)
