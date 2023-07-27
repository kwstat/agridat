# lessman.sorghum.r
# Time-stamp: c:/x/rpack/agridat/data-done/lessman.sorghum.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- import("lessman.sorghum.xlsx")
dat <- as.matrix(dat0)
dat <- melt(dat)
names(dat) <- c('row','col','yield')

lessman.sorghum.uniformity <- dat
# ----------------------------------------------------------------------------

dat <- lessman.sorghum.uniformity

# aspect 300ft tall, 48 'rows' x 40in/row / 12in/ft = 160ft wide
require(desplot)
desplot(yield ~ col*row, dat,
        main="lessman.sorghum.uniformity",
        tick=TRUE, flip=TRUE, aspect=300/(48*40/12))

# Omit outer two columns (called 'rows' by Lessman)
dat <- subset(dat, col > 2 & col < 47)
nrow(dat)
var(dat$yield) # 9.09
sd(dat$yield)/mean(dat$yield) # CV 9.2%

require(reshape2)
dmat <- acast(dat, row~col, value.var='yield')
require(agricolae)
index.smith(dmat) # Similar to Lessman Table 1
# Lessman said that varying the width of plots did not have an appreciable
# effect on CV, and optimal row length was 3.2 basic plots, about 15-20
# feet long. (Page 27)
