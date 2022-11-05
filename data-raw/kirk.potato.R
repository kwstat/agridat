# 0_template.R
# Time-stamp: <04 Nov 2022 16:17:19 c:/drop/rpack/agridat/data-raw/kirk.potato.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/one/rpack/agridat/data-raw/")
dat1 <- read_excel("kirk.potato.xlsx","yield", col_names=FALSE)
dat2 <- read_excel("kirk.potato.xlsx","gen", col_names=FALSE)
dat3 <- read_excel("kirk.potato.xlsx","rep", col_names=FALSE)

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,gen=value)
dat3 %<>% as.matrix %>% `colnames<-`(1:ncol(dat3)) %>% melt %>% rename(row=Var1,col=Var2,rep=value)

dat <- cbind(dat3, gen=dat2$gen, yield=dat1$yield)
head(dat)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=1,
        main="kirk.potato")

kirk.potato <- dat

agex(kirk.potato)


# Match means in Table I
dat %>% group_by(gen) %>% summarize(mn=mean(yield)) %>% as.data.frame()


