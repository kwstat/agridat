# shaw.oats.R

libs(readxl,tidyverse)
dat <- read_xlsx("c:/x/rpack/agridat/data-done/shaw.oats.xlsx")
dat <- melt(dat, id.vars=c("env","year","block"))
names(dat)[4:5] <- c("variety","yield")

# ----------------------------------------------------------------------------

dat <- shaw.oats
# sum(dat$yield) # 16309 matches Shaw p. 125
# sum( (dat$yield-mean(dat$yield)) ^2) # total SS matches Shaw p. 141

dat$year <- factor(dat$year)
library(lattice)
xyplot(yield ~ variety|year, data=dat, groups=env,
       main="shaw.oats",
       auto.key=TRUE)

# Shaw & Bose meticulously calculate the ANOVA table, p. 141
m1 <- aov(yield ~ year*env*block*variety - year:env:block:variety, dat)
anova(m1)

