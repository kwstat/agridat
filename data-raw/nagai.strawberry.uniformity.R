# 0_template.R
# Time-stamp: <03 Apr 2018 21:48:38 c:/x/rpack/agridat/data-raw/nagai.strawberry.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("nagai.strawberry.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

desplot(yield ~ col*row, dat, main=NULL)

nagai.strawberry.uniformity <- dat

# ----------------------------------------------------------------------------


