# lander.multi.R
# Time-stamp: <27 Feb 2018 11:50:46 c:/x/rpack/agridat/data-done/lander.multi.R>

Lander, P. E. et al. (1938).
"Soil Uniformity Trials in the Punjab I."
Ind. J. Agr. Sci. 8:271-307.

# ----------------------------------------------------------------------------

libs(dplyr,readxl,reshape2)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_excel("lander.multi.uniformity.xlsx",1, col_names=FALSE)
d2 <- read_excel("lander.multi.uniformity.xlsx",2, col_names=FALSE)
d3 <- read_excel("lander.multi.uniformity.xlsx",3, col_names=FALSE)
d4 <- read_excel("lander.multi.uniformity.xlsx",4, col_names=FALSE)

d1 <- d1 %>% as.matrix %>%
  `rownames<-`(1:nrow(d1)) %>% `colnames<-`(1:ncol(d1)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

d2 <- d2 %>% as.matrix %>%
  `rownames<-`(1:nrow(d2)) %>% `colnames<-`(1:ncol(d2)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

d3 <- d3 %>% as.matrix %>%
  `rownames<-`(1:nrow(d3)) %>% `colnames<-`(1:ncol(d3)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

d4 <- d4 %>% as.matrix %>%
  `rownames<-`(1:nrow(d4)) %>% `colnames<-`(1:ncol(d4)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)


d1$year <- 1929; d1$crop <- "wheat"
d2$year <- 1930; d2$crop <- "chari"
d3$year <- 1931; d3$crop <- "wheat"
d4$year <- 1932; d4$crop <- "wheat"

lander.multi.uniformity <- rbind(d1,d2,d3,d4)
lander.multi.uniformity <- mutate(lander.multi.uniformity, yield=yield/10)

dat <- lander.multi.uniformity

# Division means
filter(dat, year==1929 & row >= 27) %>% summarise(yld=mean(yield))
filter(dat, year==1930 & row >= 27) %>% summarise(yld=mean(yield))

dd <- arrange(dat, year, col, row)
dd$lagyield <- dd$yield-lag(dd$yield)

# Heatmaps for single years, compare to Lander fig 3, 4, 5, 6
if(0){
  dat29 <- filter(dat, year==1929)
  desplot(yield ~ col*row|year, dat29,
          flip=TRUE, tick=TRUE, aspect=(1037.1/939.12))
  dat30 <- filter(dat, year==1930)
  desplot(yield ~ col*row|year, dat30,
          flip=TRUE, tick=TRUE, aspect=(1037.1/939.12))
  dat31 <- filter(dat, year==1931)
  desplot(yield ~ col*row|year, dat31,
          flip=TRUE, tick=TRUE, aspect=(1037.1/939.12))
  dat32 <- filter(dat, year==1932)
  desplot(yield ~ col*row|year, dat32,
          flip=TRUE, tick=TRUE, aspect=(1037.1/939.12))
}

