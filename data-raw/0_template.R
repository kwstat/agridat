# 0_template.R
# Time-stamp: <09 Jan 2018 15:46:56 c:/x/rpack/agridat/data-raw/0_template.R>

libs(dplyr,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat1 <- read_excel("bose.multi.xlsx","Sheet1", col_names=FALSE)
dat2 <- read_excel("bose.multi.xlsx","Sheet2", col_names=FALSE)
dat3 <- read_excel("bose.multi.xlsx","Sheet3", col_names=FALSE)

# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat1 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1930", crop="barley")

dat2 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1931", crop="wheat")

dat3 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1932", crop="lentil")
