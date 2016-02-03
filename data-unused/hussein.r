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

G.C.C. Tai, 1971
Genotypic stability analysis and its application to potato regional trials.
Crop Sci 11, 184-190.

dat <- import("hussein.stability.xlsx",sheet=2)

# ----------------------------------------------------------------------------

dat <- import("hussein.stability.xlsx",sheet=5, col_names=FALSE)
colnames(dat) <- paste0('L',pad(0:18))
rownames(dat) <- dat[,1]
dat <- as.matrix(dat[,2:19])
image(dat)
dat2 <- melt(dat)
names(dat2) <- c('gen','loc','yield')
dat2$region <- ifelse(dat2$loc %in% c('L10','L11','L12','L13','L14','L15','L16','L17','L18'),
                      'Atlantic','Ontario')
dat2 <- subset(dat2, !is.na(yield))
dat <- dat2

#aggregate(yield ~ loc, dat, max) # Match table 1
dat %>% group_by(loc) %>% summarize(max(yield))

# Index response of table 1
balg <- c('Bruce','Laurier','Leger','S1','S2','S3','S4','S5','S6','S7','T1','T2')
dat %>% filter(gen %in% balg) %>% group_by(loc) %>% summarize(mean(yield))

# ----------------------------------------------------------------------------
