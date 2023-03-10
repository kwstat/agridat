
libs(desplot,dplyr,kw,lattice,lucid,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat1 <- read_excel("khan.brassica.xlsx","Sheet1", col_names=FALSE)
dat2 <- read_excel("khan.brassica.xlsx","Sheet2", col_names=FALSE)

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

dat <- rbind(
  cbind(field=rep("F1", 324), dat1),
  cbind(field=rep("F2", 324), dat2) )
head(dat)

khan.brassica.uniformity <- dat

agex(khan.brassica.uniformity)

## ---------------------------------------------------------------------------

# Slightly different results than Khan Table 1.
dat %>%
  mutate(yield=yield/8) %>% 
  group_by(field) %>%
  summarize(mn=mean(yield), sd=sd(yield)) %>%
  lucid(5)

require(desplot)
desplot(dat, yield ~ col*row | field,
        flip=TRUE, aspect=1,
        main="khan.brassica.uniformity")
