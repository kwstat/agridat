# sayer.sugarcane.uniformity.R
# Time-stamp: <07 Sep 2022 18:11:11 c:/one/rpack/agridat/data-raw/sayer.sugarcane.uniformity.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/one/rpack/agridat/data-raw/")

# 32 data was dictated using Windows' dictation tool, column-wise, then
# transposed into Excel. Missing values were coded as -1

# 33 & 34 data
# Used onlineocr.net to convert images to Excel. Manual edits.
# All numbers checked by hand.

dat32 <- read_excel("sayer.sugarcane.uniformity.xlsx", sheet="1932", col_names=F)
dat33 <- read_excel("sayer.sugarcane.uniformity.xlsx", sheet="1933", col_names=F)
dat34 <- read_excel("sayer.sugarcane.uniformity.xlsx", sheet="1934", col_names=F)

dat32 <- dat32 %>% as.matrix %>%
  `rownames<-`(1:nrow(dat32)) %>% `colnames<-`(1:ncol(dat32)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)
dat32$yield <- ifelse(dat32$yield < 0, NA, dat32$yield) # introduce missing values
dat33 <- dat33 %>% as.matrix %>%
  `rownames<-`(1:nrow(dat33)) %>% `colnames<-`(1:ncol(dat33)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)
dat34 <- dat34 %>% as.matrix %>%
  `rownames<-`(1:nrow(dat34)) %>% `colnames<-`(1:ncol(dat34)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

dat32$year <- 1932
dat33$year <- 1933
dat34$year <- 1934
sayer.sugarcane.uniformity <- rbind(dat32, dat33, dat34)

# ----------------------------------------------------------------------------



dat32 <- subset(sayer.sugarcane.uniformity, year==1932)
dat33 <- subset(sayer.sugarcane.uniformity, year==1933)
dat34 <- subset(sayer.sugarcane.uniformity, year==1934)

# 1932.
# Sawyer Table 1 has 92.65. Data says 92.36
filter(dat32, row<=40) %>% pull(yield) %>% mean(na.rm=TRUE)
# Sawyer 30.55. Data 30.95
filter(dat32, row<=40) %>% pull(yield) %>% sd(na.rm=TRUE)

b1 <- subset(dat33, row<31)
b2 <- subset(dat33, row > 30 & row < 61)
b3 <- subset(dat33, row > 60 & row < 91)
b4 <- subset(dat33, row > 105 & row < 136)
mean(b1$yield) # 340.7 vs Sayer 340.8
mean(b2$yield) # 338.2 vs Sayer 338.6
mean(b3$yield) # 331.3 vs Sayer 330.2
mean(b4$yield) # 295.4 vs Sayer 295.0

mean(dat34$yield) # 270.83 vs Sayer 270.83

desplot(dat32, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=144/605, # true aspect
        main="sayer.sugarcane.uniformity 1932")
desplot(dat33, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=408/480, # true aspect
        main="sayer.sugarcane.uniformity 1933")
desplot(dat34, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=363/480, # true aspect
        main="sayer.sugarcane.uniformity 1934")

