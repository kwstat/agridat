The field had 24 rows, 80 m long, separated by 0.915 m.

The block of 24 rows, each 80 meters long, was subdivided into 384 plots. Each plot consisted of a single, five-meter-long row and had an area of 4.57 square meters.

These plots will be referred to as 'basic units', and each basic unit formed a harvest pile (parva¹). The basic units were harvested separately, placing the yield from each into properly identified paper bags, after which the basic units were weighed.

¹Parva refers to the pile or stack of harvested canes from a single plot, gathered together for weighing.

The 384 parcels of basic units appears in Table 5.

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

Data in table 5, p. 22.

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("delgadillolopez.sesame.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(24*0.915)/(16*5),
        main="delgadillolopez.sesame.uniformity")

delgadillolopez.sesame.uniformity <- dat

agex(delgadillolopez.sesame.uniformity)
