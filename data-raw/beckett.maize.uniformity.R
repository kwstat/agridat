# 0_template.R
# Time-stamp: <2024-12-06 14:04:31 wrightkevi>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("beckett.maize.uniformity.xlsx","Sheet1", col_names=TRUE)
head(dat)

require(desplot)

# QC. germination, earnum match published values.
# stalks published value is 33091, but here 33101. (Data were hand-checked)
colSums(dat)

# Examine correlations
dat2 = dat
dat2 <- dat2[rev(order(dat2$earnum)),]
dat2 <- dat2[!is.na(dat2$yield),]
pairs(dat2[ , c("germination","stalks","earnum","earwt","yield")]) # earwt,yield high cor

desplot(dat, germination ~ col*row,
        flip=TRUE, aspect=19/6,
        main="beckett.maize.uniformity - stalks")

beckett.maize.uniformity <- dat

agex(beckett.maize.uniformity)
