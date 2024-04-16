# kgeisler.vine.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- readr::read_csv("geisler.vine.uniformity.csv", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(104*1.33*7)/(4*22.5*7), ticks=TRUE,
        main="geisler.vine.uniformity")

mean(dat$yield) # 43.98
var(dat$yield) # 26.54

geisler.vine.uniformity <- dat

agex(geisler.vine.uniformity)
