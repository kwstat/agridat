# hutchinson.cotton.R
# Time-stamp: <23 Jan 2018 15:44:19 c:/x/rpack/agridat/data-done/hutchinson.cotton.R>

libs(dplyr,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- read_excel("hutchinson.cotton.xlsx","Sheet1", col_names=FALSE)
dim(dat1)

dat1 %<>% as.matrix %>% `colnames<-`(1:32) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat <- dat1

hutchinson.cotton.uniformity <- dat
# ----------------------------------------------------------------------------

