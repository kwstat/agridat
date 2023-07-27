# 0_template.R
# Time-stamp: <12 Jul 2023 16:58:17 c:/drop/rpack/agridat/data-raw/nagai.strawberry.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("nagai.strawberry.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

desplot(yield ~ col*row, dat, main=NULL)

nagai.strawberry.uniformity <- dat



