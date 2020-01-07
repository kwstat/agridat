# 0_hartman.tomato.uniformity.R
# Time-stamp: <11 Jul 2018 08:11:37 c:/x/rpack/agridat/data-raw/hartman.tomato.uniformity.



libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("hartman.tomato.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat$yield <- dat$yield/10


agex(hartman.tomato.uniformity)
