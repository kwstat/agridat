
libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("deoliveira.lupin.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=20/50, tick=TRUE,
        main="deoliveira.lupin.uniformity")

deoliveira.lupin.uniformity <- dat

agex(deoliveira.lupin.uniformity)
