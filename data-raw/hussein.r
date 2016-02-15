# hussein.r
# Time-stamp: c:/x/rpack/agridat/data-unused/hussein.r

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(reshape2)
library(rio)

setwd("c:/x/rpack/agridat/data-unused/")

dat <- import("hussein.stability.xlsx",sheet=1)

# 33 gen, 12 loc
C. S. Lin, M. R. Binns
Procedural approach for assessing cultivar-location data: Pairwise genotype-environment interactions of test cultivars with checks
Canadian Journal of Plant Science, 1985, 65(4): 1065-1071. Table 1.
http://doi.org/10.4141/cjps85-136

m1 <- lm(yield ~ loc + gen, data=dat)
anova(m1)
m1 <- kw:::fw2(yield ~ gen*loc, data=dat)
plot(m1)


# dat %>% group_by(gen) %>% summarize(gen=mean(gen))

# Match means in Table 4
aggregate(yield ~ gen, data=dat, mean)

# ----------------------------------------------------------------------------

