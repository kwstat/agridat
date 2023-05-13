
# saunders.maize.R

These two maize uniformity trials were conducted by Potchefstroom Experiment Station, South Africe.

Each harvested unit was a plot of 10 plants, planted 3 feet by 3 feet in individual hills.

Two possible outliers in the 1929-30 data were verified as being correctly transcribed from the source document.

Rothamsted library scanned the paper documents to pdf. Screen captures were saved as jpg files, then uploaded to an OCR conversion site. The resulting text was about 95 percent accurate and was carefully hand-checked and formatted into csv files.

# 1928-1929 experiment

Rows 41-43 are missing.

Field width: 4 plots * 10 yards = 40 yards

Field length : 250 plots * 1 yard = 250 yards

# Dataset 1929-30

Row 255 is missing

Field width: 5 plots * 20 yards = 100 yards

Field length: 300 plots * 1 yard = 300 yards


libs(dplyr,readr,kw, reshape2)

setwd("c:/drop/rpack/agridat/data-raw")

# multiple matrices

dat29 <- read_csv("saunders_maize_1929.csv", col_names=FALSE)
dim(dat29)
dat30 <- read_csv("saunders_maize_1930.csv", col_names=FALSE, col_types="ddddd")
dim(dat30)


# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat29 %<>% as.matrix %>% `colnames<-`(1:ncol(dat29)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1929")

dat30 %<>% as.matrix %>% `colnames<-`(1:ncol(dat30)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1930")

dat <- rbind(dat29,dat30)

saunders.maize.uniformity <- dat

## ---------------------------------------------------------------------------

dat <- saunders.maize.uniformity

libs(desplot)

desplot(dat, yield ~ col*row, subset=year==1929,
        flip=TRUE, aspect=250/40,
        main="saunders.maize.uniformity 1928-29")
desplot(dat, yield ~ col*row, subset=year==1930,
        flip=TRUE, aspect=300/100,
        main="saunders.maize.uniformity 1929-30")
