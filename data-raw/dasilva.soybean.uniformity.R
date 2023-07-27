# dasilva.soybean.uniformity.R
# Time-stamp: <12 Jul 2023 16:42:51 c:/drop/rpack/agridat/data-raw/dasilva.soybean.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("dasilva.soy.uniformity.xlsx","Sheet1", col_names=TRUE)
dat <- dat[,-1]

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat$yield <- dat$yield/100

dasilva.soy.uniformity <- dat

