# 0_template.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/one/rpack/agridat/data-raw/")
dat <- read_csv("arankacami.groundnut.csv", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, aspect=1,
        main="arankacami.groundnut.uniformity")

arankacami.groundnut.uniformity <- dat

agex(arankacami.groundnut.uniformity)
