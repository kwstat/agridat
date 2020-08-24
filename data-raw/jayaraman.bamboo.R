# jayaraman.bamboo.R
# Time-stamp: <24 Aug 2020 14:06:49 c:/x/rpack/agridat/data-raw/jayaraman.bamboo.R>

libs(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("jayaraman.bamboo.xlsx")
dat <- janitor::clean_names(dat0)
dat <- rename(dat, F1=x4, F2=x5, F3=x6, F4=x7, F5=x8, F6=x9)
head(dat)
d2 <- melt(dat, id.vars=c("loc","block","tree") )
d2 <- rename(d2, family=variable, height=value)

jayaraman.bamboo <- d2
agex(jayaraman.bamboo)



bwplot(height ~ family|loc, d2)
m1 <- aov(height ~ loc+loc:block + family + family:loc + family:loc:block, data=d2)
anova(m1)

# more modern approach with mixed model, match variance components needed
# in equation 6.9, heritability of the half-sib averages as
m2 <- lme4::lmer(height ~ 1 + (1|loc/block) + (1|family/loc/block), data=d2)
lucid::vc(m2)
