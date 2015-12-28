# plaisted.potatoes.r
# Time-stamp: c:/x/rpack/agridat/plaisted.potatoes.r

# Source: Plaisted, Sanford, Federer, Kehr, Peterson
# Specific and general combining ability for yield in potatoes
# Table 1-3 have "Unadjusted total yields of six ten-hill plots"
# Table 8 has anova of "intrablock adjusted treatment means"

# Sanford 1960 PhD thesis
# Comparative evaluation of clones as testers for yield, specific
# gravity and tuber appearance in the potato
# Table 10-12 have adjusted yields

# I can't match anything from Plaisted...

library(asreml)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat2/unused/")
d1 <- import("sanford.potato.xlsx",sheet=1)
d2 <- import("sanford.potato.xlsx",sheet=2)

dm1 <- melt(d1, id.vars=c('loc','line','gen'))
names(dm1) <- c('loc','line','gen','tester','raw')
dm2 <- melt(d2, id.vars=c('loc','line','gen'))
names(dm2) <- c('loc','line','gen','tester','adj')

kk <- subset(dm2, !is.na(adj))
with(kk, table(line,tester))
kk <- subset(kk, line %in% c(4,5,6,7,11,19,30,42))
kk <- droplevels(kk)
kk <- transform(kk, yield = adj/6) # There are 6 plots, so divide by 6

m00 <- aov(terms(yield ~ gen + gen:loc + tester + tester:loc + gen:tester, keep.order=TRUE),
          data=kk)
anova(m00)

m01 <- asreml(adj/6 ~ 1, data=kk,
             random = ~ gen + gen:loc + tester + tester:loc + gen:tester)
vc(m01)



m12 <- merge(dm1,dm2,by=c('loc','gen','tester','line'))

dat <- m12

d8 <- subset(dat, gen %in% c("I1077W28-5","I1114-2","Early Gem","B1396-N2",
                             "B922-3","B3556-12","I1165-14","Osage"))
d8 <- droplevels(d8)
d8 <- transform(d8, yield = adj/6) # There are 6 plots, so divide by 6

m0 <- aov(terms(yield ~ gen + gen:loc + tester + tester:loc + gen:tester, keep.order=TRUE),
                data=d8)
anova(m0) # This is roughly similar to table 8.  The df match, but not the

m1 <- lm(yield ~ gen + gen:loc + tester + tester:loc + gen:tester, data=d8)
anova(m1) # This is roughly similar to table 8.  The df match, but not the



# ----------------------------------------------------------------------------

d1 <- import("plaisted.potatoes.xlsx",sheet=1)
d2 <- import("plaisted.potatoes.xlsx",sheet=2)
d3 <- import("plaisted.potatoes.xlsx",sheet=3)

d1$sum <- d2$sum <- d3$sum <- NULL
d1 <- d1[1:45,]
d2 <- d2[1:45,]
d3 <- d3[1:45,]

library(reshape2)

m1 <- melt(d1)
names(m1) <- c('gen','tester','yield')
m1 <- cbind(loc="ClearLake",m1)

m2 <- melt(d2)
names(m2) <- c('gen','tester','yield')
m2 <- cbind(loc="Riverhead",m2)

m3 <- melt(d3)
names(m3) <- c('gen','tester','yield')
m3 <- cbind(loc="Ithaca",m3)

dat <- rbind(m1,m2,m3)
dat <- subset(dat, !is.na(yield))
dat$gen <- factor(dat$gen)

dat0 <- dat
# ----------------------------------------------------------------------------

# The 8 lines that are crossed with all testers

d8 <- subset(dat0, gen %in% c("I1077W28-5","I1114-2","Early Gem","B1396-N2",
                             "B922-3","B3556-12","I1165-14","Osage"))
d8 <- droplevels(d8)
d8 <- transform(d8, yield = yield/6) # There are 6 plots, so divide by 6

m0 <- aov(yield ~ gen + gen:loc +
             tester + tester:loc + gen:tester, data=d8)
anova(m0) # This is roughly similar to table 8.  The df match, but not the
# mean squares

lib(kw)
heat(raw ~ gen*tester, data=subset(dat, loc=="Ithaca"), main="raw", cluster=0)
heat(adj ~ gen*tester, data=subset(dat, loc=="Ithaca"), main="adj", cluster=0)

lib(asreml)

m1 <- asreml(yield~gen + gen:loc +
             tester + tester:loc + gen:tester, data=dat)
lib(lucid)
vc(m1)

m1 <- asreml(adj/6~1, data=dat, subset=loc=="Ithaca",
             random = ~ gen + tester)
vc(m1)


m2 <- asreml(adj/6~1, data=dat, subset=loc=="Riverhead",
             random = ~ gen + tester)
vc(m2)


m3 <- asreml(adj/6~1, data=dat, subset=loc=="ClearLake",
             random = ~ gen + tester)
vc(m3)

m4 <- asreml(adj/6 ~ 1, data=d8,
             random = ~ gen + gen:loc + tester + tester:loc + gen:tester)
vc(m4)
