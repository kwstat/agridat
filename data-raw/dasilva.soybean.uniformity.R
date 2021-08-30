# dasilva.soybean.uniformity.R
# Time-stamp: <30 Aug 2021 15:30:12 c:/one/rpack/agridat/data-raw/dasilva.soybean.uniformity.R>
# 0_template.R
# Time-stamp: <03 Apr 2018 17:50:46 c:/x/rpack/agridat/data-raw/0_template.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("dasilva.soy.uniformity.xlsx","Sheet1", col_names=TRUE)
dat <- dat[,-1]

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat$yield <- dat$yield/100

dasilva.soy.uniformity <- dat

