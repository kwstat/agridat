# 0_template.R
# Time-stamp: <13 Jun 2022 10:53:47 c:/one/rpack/agridat/data-raw/cochran_folder2/2639_ducker_groundnut.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/one/rpack/agridat/data-raw/cochran_folder2")
dat <- read_excel("2639_ducker_groundnut.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=110/44,
        main="ducker.groundnut.uniformity")

ducker.groundnut.uniformity <- dat

agex(ducker.groundnut.uniformity)


The experiment was grown in Nyasaland, Cotton Experiment Station, Domira Bay, 1942-43. There were 44x5 identical plots, each 1/220 acre in area. Single ridge plots each one chain in length, and one yard apart. Two rows of groundnuts are planted per ridge, staggered at 1 foot between holes. Holes are spaced 18 inches x 12 inches. Two seeds are planted per hole.
The yield values are pounds of nuts in shell.

Field length: 5 plots, 22 yards each = 110 yards.

Field width: 44 plots, 1 yard each = 44 yards.

Rothamsted Archive, Box STATS17  WG Cochran, Folder 2.
This data was made available with special help from Catherine Fearnhead at Rothamstead Research.

