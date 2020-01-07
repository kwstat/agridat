# baker.strawberry.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")

dat1 <- read_excel("baker.strawberry.uniformity.xlsx",1, col_names=FALSE)
dat2 <- read_excel("baker.strawberry.uniformity.xlsx",2, col_names=FALSE)

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat1 <- cbind(trial="T1", dat1)
dat2 <- cbind(trial="T2", dat2)

baker.strawberry.uniformity <- rbind(dat1, dat2)

