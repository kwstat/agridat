# jayaraman.bamboo.R
# Time-stamp: <24 Aug 2020 14:06:49 c:/x/rpack/agridat/data-raw/jayaraman.bamboo.R>

libs(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")

dat1 <- read_excel("jayaraman.bamboo.uncorrected.xlsx")
head(dat1)
d1 <- melt(dat1, id.vars=c("loc","block","tree") )
d1 <- rename(d1, family=variable, height=value)
d1 <- select(d1, loc, block, family, tree, height)
head(d1)
jayaraman.bamboo.uncorrected <- d1

dat2 <- read_excel("jayaraman.bamboo.xlsx")
head(dat2)
d2 <- melt(dat2, id.vars=c("loc","block","tree") )
d2 <- rename(d2, family=variable, height=value)
d2 <- select(d2, loc, block, family, tree, height)
head(d2)
jayaraman.bamboo <- d2

kw::agex(jayaraman.bamboo, prompt = FALSE)
kw::agex(jayaraman.bamboo.uncorrected, prompt = FALSE)

bwplot(height ~ family|loc, d2)
m1 <- aov(height ~ loc+loc:block + family + family:loc + family:loc:block, data=d2)
anova(m1)

# more modern approach with mixed model, match variance components needed
# in equation 6.9, heritability of the half-sib averages as
m2 <- lme4::lmer(height ~ 1 + (1|loc/block) + (1|family/loc/block), data=d2)
lucid::vc(m2)
