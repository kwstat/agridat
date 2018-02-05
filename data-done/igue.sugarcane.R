# igue.sugarcane.R
# Time-stamp: <05 Feb 2018 15:12:27 c:/x/rpack/agridat/data-done/igue.sugarcane.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)
setwd("c:/x/rpack/agridat/data-done/")

dat0 <- read_excel("igue.sugarcane.xlsx", col_names=FALSE)

dat <- dat0
dat <- dat %>% as.matrix %>%
  `rownames<-`(1:nrow(dat)) %>% `colnames<-`(1:ncol(dat)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

A uniformity trial with sugarcane in the state of Sao Paulo, Brazil.
Plots were 1.5 m by 2 m.

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          flip=TRUE, tick=TRUE,
          main="igue.sugarcane.uniformity")
  }

