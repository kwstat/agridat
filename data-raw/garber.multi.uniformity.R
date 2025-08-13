# 0_template.R
# Time-stamp: <2025-03-05 18:13:05 wrightkevi>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")

# Paper #1 - Garber (1926)

# First, melt the existing garber.multi.uniformity
tmp <- agridat::garber.multi.uniformity
tmp <- melt(tmp, id.var=c("row","col") )
tmp <- rename(tmp, crop=variable, yield=value)
tmp <- mutate(tmp, year=ifelse(crop=="oats", 1923, 1924))
head(tmp)

# Now add the plotnum
plotnum23 <- read_excel("garber.multi2.uniformity.xlsx","plotnum23", col_names=FALSE)
plotnum23 %<>% as.matrix %>% `colnames<-`(1:ncol(plotnum23)) %>% melt %>% rename(row=Var1,col=Var2,plotnum=value)

tmp <- left_join(tmp, plotnum23)
head(tmp)

# Paper #2 - Garber (1931)

dat27 <- read_excel("garber.multi2.uniformity.xlsx","1927", col_names=FALSE)
dat28 <- read_excel("garber.multi2.uniformity.xlsx","1928", col_names=FALSE)
dat29 <- read_excel("garber.multi2.uniformity.xlsx","1929", col_names=FALSE)

dat27 %<>% as.matrix %>% `colnames<-`(1:ncol(dat27)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year=1927, crop="corn") %>% mutate(yield=yield/10)
# Convert percent deviation back to absolute yield
dat27 <- mutate(dat27, yield = (yield/100) * 76.1 + 76.1)
mean(dat27$yield, na.rm=TRUE)

dat28 %<>% as.matrix %>% `colnames<-`(1:ncol(dat28)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year=1928, crop="oats") %>% mutate(yield=yield/10)
dat28 <- mutate(dat28, yield = (yield/100) * 32.8 + 32.8)
mean(dat28$yield, na.rm=TRUE)

dat29 %<>% as.matrix %>% `colnames<-`(1:ncol(dat29)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year=1929, crop="wheat") %>% mutate(yield=yield/10)
dat29 <- mutate(dat29, yield = (yield/100) * 19.4 + 19.4)
mean(dat29$yield, na.rm=TRUE)

dat <- dplyr::bind_rows(dat27, dat28, dat29)
head(dat)

# add the plot number
plotnum27 <- read_excel("garber.multi2.uniformity.xlsx","plotnum27", col_names=FALSE)
plotnum27 %<>% as.matrix %>% `colnames<-`(1:ncol(plotnum27)) %>% melt %>% rename(row=Var1,col=Var2,plotnum=value)

dat <- left_join(dat, plotnum27)

# Stack them
newdat <- rbind(
  select(tmp, row, col, plot=plotnum, year, crop, yield),
  select(dat, row, col, plot=plotnum, year, crop, yield)
)
head(newdat)

dat <- newdat

garber.multi.uniformity <- dat
kw::agex(garber.multi.uniformity, prompt=FALSE)

libs(desplot)
desplot(dat, yield ~ col*row|year,
        flip=TRUE, tick=TRUE, aspect=945/436, # true aspect
        main="garber.multi.uniformity oats")


