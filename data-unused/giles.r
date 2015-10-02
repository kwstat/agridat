
# Piepho 2003.
# Model-based mean adjustment in quantitative germplasm evaluation data

# Straw length of genotype * year

# Two-way bilinear model.  Original paper also has ear-length data.

lib(kw)
dat <- import("c:/x/rpack/agridat/data-unused/giles.csv", head=TRUE)
dat
rownames(dat) = dat[,1]
dat[,1] = NULL
dat
library(reshape2)
dat2 = melt(as.matrix(dat))
h(dat2)
colnames(dat2) = cc(gen,year,length)
dat2 = subset(dat2, !is.na(length))
h(dat2)

# Simple two-way model.  NOT the bi-additive model of Piepho.
m1 = lm(length ~ 0 + factor(gen) + factor(year), data=dat2)
library(lsmeans)
lsmeans(m1, 'gen')
