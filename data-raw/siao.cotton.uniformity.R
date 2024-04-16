# 0_template.R
# Time-stamp: <16 Apr 2024 14:55:06 c:/drop/rpack/agridat/data-raw/siao.cotton.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# multiple matrices
setwd("c:/drop/rpack/agridat/data-raw")
dat1 <- read_excel("siao.cotton.uniformity.xlsx","1930", col_names=FALSE)
dat2 <- read_excel("siao.cotton.uniformity.xlsx","1931a", col_names=FALSE)
dat3 <- read_excel("siao.cotton.uniformity.xlsx","1931b", col_names=FALSE)
dat4 <- read_excel("siao.cotton.uniformity.xlsx","1932", col_names=FALSE)

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(crop="1930")
dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(crop="1931a")
dat3 %<>% as.matrix %>% `colnames<-`(1:ncol(dat3)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(crop="1931b")
dat4 %<>% as.matrix %>% `colnames<-`(1:ncol(dat4)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(crop="1932")


dat <- dplyr::bind_rows(dat1, dat2, dat3, dat4)
dat <- mutate(dat, yield=yield/10)
str(dat)
desplot(dat, yield~col*row|crop, tick=TRUE, flip=TRUE)

siao.cotton.uniformity <- dat
agex(siao.cotton.uniformity)
