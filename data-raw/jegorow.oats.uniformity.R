# jegorow.oats.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")

dat <- read_excel("jegorow.oats.uniformity.xlsx", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

head(dat)

# Excel spreadsheet omitted decimals when typed
dat <- mutate(dat, yield = yield/100)

jegorow.oats.uniformity = dat
kw::agex(jegorow.oats.uniformity)

mean(dat$yield) # 202.8

libs(desplot)
desplot(dat, yield~col*row, 
        aspect=10/24, flip=TRUE, tick=TRUE,
        main="jegorow.oats.uniformity")

