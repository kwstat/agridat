# 0_template.R
# Time-stamp: <2026-03-14 21:04:11 wrightkevi>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)
setwd("c:/drop/rpack/agridat/data-raw/")

# ----------------------------------------------------------------------------

dat <- read_csv("buesocampos.tomato.uniformity.csv", col_names=FALSE)
dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

mean(dat$yield) # 5.1185 match page 43
var(dat$yield) # 2.7347 matches

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(26*0.9)/(10*4),
        main="buesocampos.tomato.uniformity")

buesocampos.tomato.uniformity <- dat
agex(buesocampos.tomato.uniformity)


# -----------------------------------------------------------------------------

dat <- read_csv("buesocampos.melon.uniformity.csv", col_names=FALSE)
dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

mean(dat$yield) 
var(dat$yield)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(24*1)/(20*1.8),
        main="buesocampos.melon.uniformity")

buesocampos.melon.uniformity <- dat
agex(buesocampos.melon.uniformity)
