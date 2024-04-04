# jurowski.wheat.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_csv("jurowksi.wheat.uniformity.csv", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

head(dat)

jurowski.wheat.uniformity = dat
kw::agex(jurowski.wheat.uniformity)

libs(desplot)
desplot(dat, yield~col*row,
        aspect=10/24, flip=TRUE, tick=TRUE,
        main="jurowski.wheat.uniformity")
