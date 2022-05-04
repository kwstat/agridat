# little.rcbrepeated.R
# Time-stamp: <20 Mar 2022 11:50:27 c:/one/rpack/agridat/data-raw/little.rcbrepeated.R>

# Little & Hills, p 126
# Unused. 

library(pacman)
p_load(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)
asreml.options(colourise=FALSE)

# 5 blocks, 4 harvests, 4 genotypes

setwd("c:/one/rpack/agridat/data-raw/")
dat0 <- read_csv("little.rcbrepeated.csv")
dat <- janitor::clean_names(dat0)
dat <- mutate_at(dat, vars(), factor)
head(dat)
dat <- rename(dat, gen=genotype)

dat <- mutate(dat, gen=factor(gen), block=factor(block), harvest=factor(harvest))
libs(dplyr,lattice)
xyplot(yield ~ gen|block, dat, group=harvest, type="l", auto.key=list(columns=3))
library(asreml)
dat <- arrange(dat, block, gen)
m1 <- aov(yield ~ block+gen, data=dat)
anova(m1)
m1 <- asreml(yield ~ block+gen, data=dat, residual= ~ block:gen:us(harvest))
m1 <- update(m1)
