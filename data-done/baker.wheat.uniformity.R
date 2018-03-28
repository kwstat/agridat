# baker.wheat.uniformity.R
# Time-stamp: <27 Mar 2018 08:11:15 c:/x/rpack/agridat/data-raw/baker.wheat.uniformity.R>

libs(dplyr,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("baker.wheat.uniformity.xlsx","Sheet1", col_names=FALSE)


# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

baker.wheat.uniformity <- dat


