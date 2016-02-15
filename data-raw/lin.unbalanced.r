# lin.unbalanced.r
# Time-stamp: c:/x/rpack/agridat/data-raw/lin.unbalanced.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- import("")

dat <- dat0

str(dat)
describe(dat)
dat <- import("hussein.stability.xlsx",sheet=4, col_names=FALSE)
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

