# johnson.douglasfir.R
# Time-stamp: <20 Nov 2018 16:17:05 c:/x/rpack/agridat/data-raw/johnson.douglasfir.R>

libs(asreml,dplyr,fs,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("johnson.douglasfir.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat$row <- 41-dat$row
dat <- rename(dat, volume=yield)

johnson.douglasfir <- dat

agex(johnson.douglasfir)
