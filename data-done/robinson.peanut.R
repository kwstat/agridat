# robinson.peanut.R
# Time-stamp: <17 Jan 2018 22:45:31 c:/x/rpack/agridat/data-raw/robinson.peanut.R>

libs(dplyr,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat1 <- read_excel("robinson.peanut.xlsx","Sheet1", col_names=FALSE)
dat2 <- read_excel("robinson.peanut.xlsx","Sheet2", col_names=FALSE)


# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat1 %<>% as.matrix %>% `colnames<-`(1:16) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1939")

dat2 %<>% as.matrix %>% `colnames<-`(1:16) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1940")

dat <- rbind(dat1,dat2)

robinson.peanut.uniformity <- dat

# ----------------------------------------------------------------------------

dat <- robinson.peanut.uniformity

# Mean yield per year. Robinson has 703.9, 787.3
# tapply(dat$yield, dat$year, mean)
#     1939     1940 
# 703.7847 787.8125 


if(require(desplot)){
  desplot(yield ~ col*row|year, dat,
          flip=TRUE, tick=TRUE, aspect=200/48,
          main="robinson.peanut.uniformity")
}
