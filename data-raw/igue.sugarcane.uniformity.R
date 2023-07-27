# igue.sugarcane.R
# Time-stamp: <05 Feb 2018 16:14:15 c:/x/rpack/agridat/data-done/igue.sugarcane.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)
setwd("c:/x/rpack/agridat/data-done/")

dat0 <- read_excel("igue.sugarcane.xlsx", col_names=FALSE)

dat <- dat0
dat <- dat %>% as.matrix %>%
  `rownames<-`(1:nrow(dat)) %>% `colnames<-`(1:ncol(dat)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

igue.sugarcane.uniformity <- dat



