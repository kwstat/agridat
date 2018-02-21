# sayer.sugarcane.uniformity.R
# Time-stamp: <20 Feb 2018 21:14:20 c:/x/rpack/agridat/data-done/sayer.sugarcane.uniformity.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-done/")

# Used onlineocr.net to convert images to Excel. Manual edits.
# All numbers checked by hand.

dat1 <- read_excel("sayer.sugarcane.uniformity.xlsx", sheet=1, col_names=F)
dat2 <- read_excel("sayer.sugarcane.uniformity.xlsx", sheet=2, col_names=F)

dat1 <- dat1 %>% as.matrix %>%
  `rownames<-`(1:nrow(dat1)) %>% `colnames<-`(1:ncol(dat1)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)
dat2 <- dat2 %>% as.matrix %>%
  `rownames<-`(1:nrow(dat2)) %>% `colnames<-`(1:ncol(dat2)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

dat1$year <- 1933
dat2$year <- 1934
sayer.sugarcane.uniformity <- rbind(dat1, dat2)

# ----------------------------------------------------------------------------



dat33 <- subset(sayer.sugarcane.uniformity, year==1933)
dat34 <- subset(sayer.sugarcane.uniformity, year==1934)

b1 <- subset(dat33, row<31)
b2 <- subset(dat33, row > 30 & row < 61)
b3 <- subset(dat33, row > 60 & row < 91)
b4 <- subset(dat33, row > 105 & row < 136)
mean(b1$yield) # 340.7 vs Sayer 340.8
mean(b2$yield) # 338.2 vs Sayer 338.6
mean(b3$yield) # 331.3 vs Sayer 330.2
mean(b4$yield) # 295.4 vs Sayer 295.0

mean(dat34$yield) # 270.83 vs Sayer 270.83

if(require(desplot)){
  desplot(yield ~ col*row, dat33,
          flip=TRUE, tick=TRUE, aspect=408/480, # true aspect
          main="sayer.sugarcane.uniformity 1933")
}
if(require(desplot)){
  desplot(yield ~ col*row, dat34,
          flip=TRUE, tick=TRUE, aspect=363/480, # true aspect
          main="sayer.sugarcane.uniformity 1934")
}
