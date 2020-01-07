# kulkarni.sorghum.R
# Time-stamp: <20 Jan 2018 15:40:44 c:/x/rpack/agridat/data-raw/kulkarni.sorghum.R>




libs(dplyr,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")

dat0 <- read_excel("kulkarni.sorghum.xlsx","1930", col_names=FALSE)
dat1 <- read_excel("kulkarni.sorghum.xlsx","1931", col_names=FALSE)
dat2 <- read_excel("kulkarni.sorghum.xlsx","1932", col_names=FALSE)

dat0 %<>% as.matrix %>% `colnames<-`(1:4) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1930")

dat1 %<>% as.matrix %>% `colnames<-`(1:4) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1931")

dat2 %<>% as.matrix %>% `colnames<-`(1:4) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1932")

dat <- rbind(dat0,dat1)
dat <- rbind(dat,dat2)

kulkarni.sorghum.uniformity <- dat

# ----------------------------------------------------------------------------

