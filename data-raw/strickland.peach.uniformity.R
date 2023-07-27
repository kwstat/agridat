# strickland.peach.uniformity.R
# Time-stamp: <12 Jul 2023 17:10:20 c:/drop/rpack/agridat/data-raw/strickland.peach.uniformity.R>

# 0_template.R
# Time-stamp: <03 Apr 2018 17:50:46 c:/x/rpack/agridat/data-raw/0_template.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("strickland.peach.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

desplot(yield ~ col*row, dat,
        main="strickland.peach.uniformity",
        flip=TRUE, aspect=1)

strickland.peach.uniformity <- dat

agex(strickland.peach.uniformity)
