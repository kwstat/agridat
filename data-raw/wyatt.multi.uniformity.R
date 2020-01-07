# wyatt.multi.uniformity.R
# Time-stamp: <07 Jan 2019 14:29:20 c:/x/rpack/agridat/data-done/wyatt.multi.uniformity.R>

# multiple sheets combined into one

libs(dplyr,magrittr,readxl,reshape2)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_excel("wyatt.multi.uniformity.xlsx",1, col_names=FALSE)
d2 <- read_excel("wyatt.multi.uniformity.xlsx",2, col_names=FALSE)

d1 <- as.matrix(d1) %>% set_colnames(1:ncol(d1)) %>% melt() %>% rename(col=Var1, row=Var2, yield=value) %>% cbind(., year=1925, crop="oats")
d2 <- as.matrix(d2) %>% set_colnames(1:ncol(d2)) %>% melt() %>% rename(col=Var1, row=Var2, yield=value) %>% cbind(., year=1926, crop="wheat")

dat <- rbind(d1,d2)

wyatt.multi.uniformity <- dat

