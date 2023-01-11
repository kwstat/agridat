# yan.winterwheat2.R

# Reason not used:
# Yan says there are 33 genotypes, but table 1 contains only 31,
# and "Zor" is a genotype that does not appear in the table, but does appear
# in the biplots (upper left quadrant).

# Source: Yan 2002, Singular Value Partitioning In Biplots, Table 1.

lib(rio)
lib(reshape2)
dat <- import("c:/x/rpack/agridat/data-unused/yan.winterwheat2.txt")
dat <- melt(dat)
colnames(dat) <- c('gen','loc','yield')
dat$gen <- factor(dat$gen)
biplot(gge(yield ~ gen*loc, dat))
