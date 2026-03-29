# 0_template.R
# Time-stamp: <2026-03-14 21:04:11 wrightkevi>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_csv("matusgutierrez.maize.uniformity.csv", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(36*0.75)/(16*3),
        main="matusgutierrez.maize.uniformity")

matusgutierrez.maize.uniformity <- dat

#agex(matusgutierrez.maize.uniformity)
agex(matusgutierrez.maize.uniformity, prompt=FALSE)

# used this to check for OCR errors in the data.
# The sorted data values mostly increased by multiples of 0.0181, which was very useful in correcting the OCR errors of the dot matrix printout.
dd = dat
dd <- arrange(dd, yield)
dd$diff <- dd$yield - lag(dd$yield)
