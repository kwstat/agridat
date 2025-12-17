Reviewed. No data. Two heatmaps of fields on page 42, 44.

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# multiple matrices

setwd("c:/drop/rpack/agridat/data-raw/")
dat1 <- read_excel("macdonald.cotton.uniformity.xlsx","A", col_names=FALSE)
dat2 <- read_excel("macdonald.cotton.uniformity.xlsx","B", col_names=FALSE)
dat1 <- dat1*10

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(field="A")
dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(field="B")

dat <- dplyr::bind_rows(dat1, dat2)
head(dat)

# In Rothamsted papers, the columns are labeled "Series A" ... "Series D".
# The diagram in the Rothamsted paper shows Series A is along East edge.
# We call that column 1 to match the heatmap of Macdonald 1939 Figure 1.

dat <- mutate(dat, col=5-col)
macdonald.cotton.uniformity <- dat
agex(macdonald.cotton.uniformity)

## ---------------------------------------------------------------------------

library(agridat)

dat <- macdonald.cotton.uniformity

desplot(dat, yield ~ col*row, subset=field=="A",
        flip=TRUE, tick=TRUE, aspect=(144*3.5)/(4*30),
        main="macdonald.cotton.uniformity - field A")
desplot(dat, yield ~ col*row, subset=field=="B",
        flip=TRUE, tick=TRUE, aspect=(144*3.5)/(4*40),
        main="macdonald.cotton.uniformity - field B")

length(subset(dat, field=="B2a")$yield)

d1 <- subset(dat, field=="B2a")
d1 <- mutate(d1, block=rep(rep(1:36, each=4), 4))
d1 <- group_by(d1, block, col)
d1 <- summarize(d1, yield=mean(yield))
d1 <- ungroup(d1)
desplot(d1, yield~col*block)

# Match MacDonald 1939 Figure 1
d2 <- subset(dat, field=="B")
d2 <- mutate(d2, block=rep(rep(1:36, each=4), 4))
d2 <- group_by(d2, block, col)
d2 <- summarize(d2, yield=mean(yield))
d2 <- ungroup(d2)
desplot(d2, yield~col*block, flip=TRUE)
