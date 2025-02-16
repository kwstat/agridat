
pacman::p_load(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("love.sugarcane.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(20*4)/(20*10),
        main="love.sugarcane.uniformity")

love.sugarcane.uniformity <- dat

agex(love.sugarcane.uniformity)

## ---------------------------------------------------------------------------

First ratoon crop at Rio Piedras Agricultural Experiment Station.

Field width: 20 "sections" * 10 feet = 200 feet.

Field length: 20 rows, spaced about 4 feet apart = 80 feet.

Weight in pounds per plot

Note: Love does not give the distance between the rows. 
