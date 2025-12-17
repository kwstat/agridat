# metzger.multi.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("metzger.multi.uniformity.xlsx","Sheet1", col_names=TRUE)
head(dat)
dat <- melt(dat, id.vars=c("row","col"))
colnames(dat) <- c("row","col","crop","yield")
head(dat)
metzger.multi.uniformity <- dat
kw::agex(metzger.multi.uniformity, prompt=FALSE)

# ----------------------------------------------------------------------------

library(agridat)
data(metzger.multi.uniformity)
dat <- metzger.multi.uniformity

libs(lattice)
# qq plot for each crop
qqmath( ~ yield | crop, data=dat,
        main="metzger.multi.uniformity - QQ plot",
        xlab="Theoretical Quantiles", ylab="Sample Quantiles",
        scales=list(x=list(relation="free"), y=list(relation="free")) )

# Convert yield values to percent of mean within each crop
dat <- dat %>%
  group_by(crop) %>%
  mutate(pom = yield / mean(yield) * 100) %>%
  ungroup()

libs(desplot)
desplot(dat, pom ~ col*row | crop,
        flip=TRUE, aspect=(12*66)/(3*33),
        main="metzger.multi.uniformity - percent of mean within crop")

# reshape to wide format for splom
libs(tidyr)
dat_wide <- select(dat, row, col, crop, yield)
dat_wide <- pivot_wider(dat_wide, names_from = crop, values_from = yield)
splom(dat_wide[ , 3:15], main="metzger.multi.uniformity - scatterplot matrix")
splom(dat[, 2:14])
dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

