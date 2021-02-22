# hadasch.lettuce.R





See also


# ----------------------------------------------------------------------------

libs(tidyverse)

setwd("c:/one/stat papers/genomic selection/Schmidt 2019" )
dat <- rio::import("hadasch.lettuce.txt") %>%
  rename(dmr=y)

datm <- rio::import("hadasch.lettuce.markers.txt")
dim(datm) # 89 301
head(datm)
##   gen x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20
## 1  G1  1  1  0  1  1  1  0  1  1   0   1   1   1   1   1   1   1   1   1   1
## 2  G2  1  1  0  1  1 -1  0  0  0   0   0  -1  -1  -1  -1  -1  -1  -1  -1  -1
## 3  G3 -1 -1  0 -1  1  1  1  1  1   1   1   1   0   1   1   1   0   1   1   1
## 4  G4  1  1  1  1  1  1  1  1  1  -1  -1  -1  -1   1   1   1   1   1   1   1
## 5  G5  1  1  1  1  1  1  1  1  1   1   1  -1  -1  -1  -1  -1  -1  -1  -1  -1
## 6  G6  1  1  1  1  1  1 -1 -1 -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1

hadasch.lettuce <- dat
hadasch.lettuce.markers <- datm
kw::agex(hadasch.lettuce)
write.table(hadasch.lettuce.markers, file="c:/x/rpack/agridat/data/hadasch.lettuce.markers.txt", sep="\t", row.names=FALSE)

# ----------------------------------------------------------------------------
libs(lattice)
dat <- hadasch.lettuce
datm <- hadasch.lettuce.markers

dotplot(dmr ~ factor(gen)|factor(loc), dat,
        group=rep, layout=c(1,3),
        main="hadasch.lettuce")

# y = loc + gen + gen:loc + block:loc + error

libs(asreml)
dat <- transform(dat, loc=factor(loc), gen=factor(gen), rep=factor(rep))
m1 <- asreml(dmr ~ 1 + gen, data=dat,
             random = ~ loc + gen:loc + rep%in%loc)
p1 <- predict(m1, classify="gen")$pvals

libs(sommer)
m2 <- mmer(dmr ~ 0 + gen, data=dat,
           random = ~ loc + gen:loc + rep%in%loc)
p2 <- coef(m2)
head(p1)
head(p2)

