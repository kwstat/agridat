# hutchinson.cotton.uniformity.R
# Time-stamp: <22 Jun 2023 13:48:30 c:/drop/rpack/agridat/data-raw/hutchinson.cotton.uniformity.R>

## ---------------------------------------------------------------------------

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("hutchinson.cotton.uniformity.xlsx","Sheet1", col_names=FALSE)

# Drop row/col names
dat <- dat[-1,]
dat <- dat[ , -1]

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

# Numbers were typed without decimals, so fix that
dat$yield <- dat$yield/10

# Note, the yellow cells in the Excel file were left blank because they were illegible in the PDF.
# The "Dead" plants were also left blank.

hutchinson.cotton.uniformity <- dat

agex(hutchinson.cotton.uniformity)

## ---------------------------------------------------------------------------

require(desplot)
desplot(dat, yield ~ col*row,
        tick=TRUE, flip=TRUE, aspect=(40*1.5)/(50*4), # true aspect
        main="hutchinson.cotton.uniformity")

