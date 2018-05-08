# strickland.tomato.uniformity.R
# Time-stamp: <07 May 2018 14:25:37 c:/x/rpack/agridat/data-raw/strickland.tomato.uniformity.R>
# 0_template.R
# Time-stamp: <07 May 2018 11:25:30 c:/x/rpack/agridat/data-raw/0_template.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("strickland.tomato.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

mean(dat$yield)
sd(dat$yield)

desplot(yield ~ col*row, dat,
        main="strickland.tomato.uniformity",
        flip=TRUE, aspect=(6*12)/(30*4))


strickland.tomato.uniformity <- dat

agex(strickland.tomato.uniformity)


