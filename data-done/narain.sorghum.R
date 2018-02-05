# narain.sorghum.R
# Time-stamp: <04 Feb 2018 15:50:54 c:/x/rpack/agridat/data-done/narain.sorghum.R>

libs(dplyr,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- read_excel("narain.sorghum.xlsx","Sheet1", col_names=FALSE)

# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat1 %<>% as.matrix %>% `colnames<-`(1:10) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

narain.sorghum.uniformity <- dat1


