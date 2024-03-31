# tulaikow.wheat.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
datw <- read_excel("tulaikow.wheat.uniformity.xlsx","winter", col_names=FALSE)
dats <- read_excel("tulaikow.wheat.uniformity.xlsx","summer", col_names=FALSE)

datw %<>% as.matrix %>% `colnames<-`(1:ncol(datw)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(season="winter")
dats %<>% as.matrix %>% `colnames<-`(1:ncol(dats)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(season="summer")

dat <- dplyr::bind_rows(datw, dats)
head(dat)


tulaikow.wheat.uniformity = dat
kw::agex(tulaikow.wheat.uniformity)

group_by(dat, season) |>
  summarize(mn=mean(yield)) # Roemer has 532, 700
# 1 summer  532.
# 2 winter  700.

libs(desplot)
desplot(dat, yield~col*row, subset=season=="winter",
        aspect=10/24, flip=TRUE, tick=TRUE,
        main="tulaikow.wheat.uniformity (winter)")
desplot(dat, yield~col*row, subset=season=="summer",
        aspect=16/15, flip=TRUE, tick=TRUE,
        main="tulaikow.wheat.uniformity (summer)")

