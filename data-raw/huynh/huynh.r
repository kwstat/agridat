# huynh.r
# Time-stamp: c:/x/rpack/agridat/data-unused/huynh/huynh.r

library(rio)

setwd("c:/x/rpack/agridat/data-unused/huynh/")
# 1 env, 92 gen, 0-9 score, 1 row per genotype
dat <- import("Cowpea Phenotypic Means.csv")
#
     env             gen score
1 2012-1 CB27/556-001-F8     6
2 2012-1 CB27/556-002-F8     6
3 2012-1 CB27/556-003-F8     1
4 2012-1 CB27/556-004-F8     8

# map data: marker, chromosome?, cM distance
1_0950	1	0.00
1_0129	1	0.55
1_0055	1	1.10
1_0100	1	1.10
1_0072	1	95.70


# genotypes: markes, genotype, allele
1_0950	1_0129	1_0055	1_0100

lib(qtl)
setwd("c:/x/rpack/agridat/data-unused/huynh")
d1 <- read.cross("csv", "", "Cowpea Phenotypic Means.csv")
