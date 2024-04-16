# wyatt.multi.uniformity.R
# Time-stamp: <22 Feb 2024 09:11:09 c:/drop/rpack/agridat/data-raw/wyatt.multi.uniformity.R>

# multiple sheets combined into one

libs(dplyr,magrittr,readxl,reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")

d1 <- read_excel("wyatt.multi.uniformity.xlsx",1, col_names=FALSE)
d2 <- read_excel("wyatt.multi.uniformity.xlsx",2, col_names=FALSE)

d1 <- as.matrix(d1) %>% set_colnames(1:ncol(d1)) %>% melt() %>% rename(col=Var1, row=Var2, yield=value) %>% cbind(., year=1925, crop="oats")
d2 <- as.matrix(d2) %>% set_colnames(1:ncol(d2)) %>% melt() %>% rename(col=Var1, row=Var2, yield=value) %>% cbind(., year=1926, crop="wheat")

dat <- rbind(d1,d2)
head(dat)

wyatt.multi.uniformity <- dat

