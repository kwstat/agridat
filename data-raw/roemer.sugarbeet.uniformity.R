# roemer.sugarbeet.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat16 <- read_excel("roemer.sugarbeet.uniformity.xlsx","1916", col_names=FALSE)
dat18 <- read_excel("roemer.sugarbeet.uniformity.xlsx","1918", col_names=FALSE)

dat16 %<>% as.matrix %>% `colnames<-`(1:ncol(dat16)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year=1916)
dat18 %<>% as.matrix %>% `colnames<-`(1:ncol(dat18)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year=1918)

dat <- dplyr::bind_rows(dat16, dat18)
head(dat)

# Divide by 10 to match original paper
dat$yield <- dat$yield / 10
dat$year = factor(dat$year)

roemer.sugarbeet.uniformity = dat
kw::agex(roemer.sugarbeet.uniformity)

libs(desplot)
desplot(dat, yield~col*row|year,
        aspect=(48*4.16)/(2*17), flip=TRUE, tick=TRUE,
        main="roemer.sugarbeet.uniformity")

