# summerby.multi.uniformity.R

# The Excel workbook tab labeled 20x100 links is for the larger-plot data
# and is not included in agridat

libs(agridat,desplot,dplyr,lattice,readxl,reshape2,rio)

setwd("c:/drop/rpack/agridat/data-raw")

d1 <- read_excel("summerby.multi.uniformity.xlsx","r222", col_names=FALSE)
d2 <- read_excel("summerby.multi.uniformity.xlsx","r223", col_names=FALSE)
d3 <- read_excel("summerby.multi.uniformity.xlsx","r224", col_names=FALSE)
d4 <- read_excel("summerby.multi.uniformity.xlsx","r225", col_names=FALSE)
d5 <- read_excel("summerby.multi.uniformity.xlsx","r226", col_names=FALSE)
d6 <- read_excel("summerby.multi.uniformity.xlsx","r322", col_names=FALSE)
d7 <- read_excel("summerby.multi.uniformity.xlsx","r324", col_names=FALSE)
d8 <- read_excel("summerby.multi.uniformity.xlsx","r323", col_names=FALSE)
d9 <- read_excel("summerby.multi.uniformity.xlsx","r326", col_names=FALSE)
d10 <- read_excel("summerby.multi.uniformity.xlsx","r425", col_names=FALSE)
d11 <- read_excel("summerby.multi.uniformity.xlsx","r424", col_names=FALSE)
d12 <- read_excel("summerby.multi.uniformity.xlsx","r425", col_names=FALSE)
d13 <- read_excel("summerby.multi.uniformity.xlsx","r525", col_names=FALSE)
d14 <- read_excel("summerby.multi.uniformity.xlsx","r524", col_names=FALSE)
d15 <- read_excel("summerby.multi.uniformity.xlsx","r527", col_names=FALSE)
d16 <- read_excel("summerby.multi.uniformity.xlsx","r526", col_names=FALSE)

d1 %<>% as.matrix %>% `colnames<-`(1:ncol(d1)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R2",year=1922,crop="maize")
d2 %<>% as.matrix %>% `colnames<-`(1:ncol(d2)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R2",year=1923,crop="maize")
d3 %<>% as.matrix %>% `colnames<-`(1:ncol(d3)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R2",year=1924,crop="maize")
d4 %<>% as.matrix %>% `colnames<-`(1:ncol(d4)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R2",year=1925,crop="maize")
d5 %<>% as.matrix %>% `colnames<-`(1:ncol(d5)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R2",year=1926,crop="maize")
d6 %<>% as.matrix %>% `colnames<-`(1:ncol(d6)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R3",year=1922,crop="oats")
d7 %<>% as.matrix %>% `colnames<-`(1:ncol(d7)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R3",year=1924,crop="oats")
d8 %<>% as.matrix %>% `colnames<-`(1:ncol(d8)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R3",year=1923,crop="oats")
d9 %<>% as.matrix %>% `colnames<-`(1:ncol(d9)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R3",year=1926,crop="oats")
d10 %<>% as.matrix %>% `colnames<-`(1:ncol(d10)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R4",year=1925,crop="alfalfa")
d11 %<>% as.matrix %>% `colnames<-`(1:ncol(d11)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R4",year=1924,crop="alfalfa")
d12 %<>% as.matrix %>% `colnames<-`(1:ncol(d12)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R4",year=1926,crop="mangels")
d13 %<>% as.matrix %>% `colnames<-`(1:ncol(d13)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R5",year=1925,crop="oats")
d14 %<>% as.matrix %>% `colnames<-`(1:ncol(d14)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R5",year=1924,crop="oats")
d15 %<>% as.matrix %>% `colnames<-`(1:ncol(d15)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R5",year=1927,crop="mangels")
d16 %<>% as.matrix %>% `colnames<-`(1:ncol(d16)) %>% melt %>% rename(col=Var1,row=Var2,yield=value) %>% mutate(range="R5",year=1926,crop="oats")

dat <- dplyr::bind_rows(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16)
head(dat)

# Adjust row numbers so that they are similar to the layout on p. 8
# and page 13 of Summerby
dat <- mutate(dat,
              row = ifelse(range=="R5", row+18, row),
              row = ifelse(range=="R4", row+12, row),
              row = ifelse(range=="R3", row+6, row) )

# Export

summerby.multi.uniformity <- dat
kw::agex(summerby.multi.uniformity)

## ---------------------------------------------------------------------------

dat <- summerby.multi.uniformity

libs(desplot)
dat <- mutate(dat, env=paste(range, year, crop))
desplot(dat, yield ~ col*row|env, aspect=(5*20)/(35*20))
qqmath( ~ yield|env, data=dat)

# Show all ranges for a single year.
dat %>% filter(year==1924) %>% desplot(yield ~ col*row, aspect=23/35, main="1924")

# Compare the variance for each dataset in Summerby, page 18, column (a)
# with what we calculate.  Very slight differences.
# libs(dplyr)
# dat %>% group_by(range,year) %>% summarize(var=var(yield))
## range  year       var  summerby
##  1 R2     1922  82404      82404
##  2 R2     1923 254780.    254780  
##  3 R2     1924 111978.    111978  
##  4 R2     1925  84515.     84515  
##  5 R2     1926 101008.    100960  
##  6 R3     1922 185031.    185031  
##  7 R3     1923 154777.    154784
##  8 R3     1924 252451.    252451  
##  9 R3     1926 472087.    472088  
## 10 R4     1924     19.3       19.341 
## 11 R4     1925     14.2       14.234 
## 12 R4     1926     14.2       14.236 
## 13 R5     1924 134472.    134472  
## 14 R5     1925 289001.    289026  
## 15 R5     1926 131714.    131714  
## 16 R5     1927      8.62       8.622

## ---------------------------------------------------------------------------

# 1921

Summerby, R. (1923).
Replication in relation to accuracy in comparative crop tests.
J. Am Soc Agron, 15.
https://www.google.com/books/edition/Proceedings_of_the_American_Society_of_A/MWU4AQAAMAAJ
https://doi.org/10.2134/agronj1923.00021962001500050004x
Reviewed. No data. Data sent to Rothamsted in 1938.
Two areas of land, 100 links by 505 links. One area was Alaska Oats. Another area was Huron wheat. fixme check if I can find this in the Rothamsted papers.

Rothamsted pdf 209, 210.


Grown at Macdonald College, Quebec, in 1921.
Two parcels of land about 300 feet apart, each 100 links x 505 links = .505 acres.
1 link = .66 feet
Field 1: Alaska Oats sown at 2 bu/acre. Sown in rows 1 link apart, 100 links long.

Field 2: Huron wheat sown at 1.75 bu/acre.

