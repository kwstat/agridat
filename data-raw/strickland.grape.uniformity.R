# 0_template.R
# Time-stamp: <08 May 2018 09:52:53 c:/x/rpack/agridat/data-raw/strickland.vine.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("strickland.vine.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(yield ~ col*row, dat,
        main="strickland.vine.uniformity",
        flip=TRUE, aspect=1)

strickland.vine.uniformity <- dat

agex(strickland.vine.uniformity)
