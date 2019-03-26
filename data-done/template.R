
# ----------------------------------------------------------------------------

# multiple sheets combined into one

libs(dplyr,readxl,reshape2,tidyverse)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_excel("kristensen.barley.uniformity.xlsx",1, col_names=FALSE)
d2 <- read_excel("kristensen.barley.uniformity.xlsx",2, col_names=FALSE)
d3 <- read_excel("kristensen.barley.uniformity.xlsx",3, col_names=FALSE)
d4 <- read_excel("kristensen.barley.uniformity.xlsx",4, col_names=FALSE)

dat <- dat %>% as.matrix %>%
  `rownames<-`(1:nrow(dat)) %>% `colnames<-`(1:ncol(dat)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

d1 %<>% as.matrix %>% setNames(., 1:ncol(d1)) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
d1 <- as.matrix(d1)
d2 <- as.matrix(d2)
d3 <- as.matrix(d3)
d4 <- as.matrix(d4)
rownames(d1) <- rownames(d1) <- rownames(d1) <- rownames(d1) <- 5:15
colnames(d1) <- colnames(d2) <- colnames(d3) <- colnames(d4) <- 1:10

d1 <- melt(d1)
d2 <- melt(d2)
d3 <- melt(d3)
d4 <- melt(d4)

names(d1) <- names(d2) <- names(d3) <- names(d4) <- c('row','col','yield')

d1$season <- 1; d1$crop <- "woolypyrol"
d2$season <- 2; d2$crop <- "woolypyrol"
d3$season <- 3; d3$crop <- "maize"
d4$season <- 4; d4$crop <- "yams"

kristensen.barley.uniformity <- rbind(d1,d2,d3,d4)

# ----------------------------------------------------------------------------

# ocr.r
# Time-stamp: <20 Jul 2017 19:52:13 c:/Dropbox/r/ocr.r>

lib(tesseract)
# Default settings
setwd("c:/x/rpack/agridat/data-raw/")
setwd("c:/x/")
d1=ocr("empire1.jpg")
cat(d1) 
##  Ymtms OBTAINED m A BLANK TEST OF COTTON
## - LENGTH 01" UNITS IIARVESTED
## _**M-WY'w_+
## f3 f2. :2. :2. :2. f2. 3. f2. :2. :2. :2. * :2. f2. :2. a.
## 1 14.8 2.7 2.4 3.8 2.9 3.4 2.8 4.5 2.6 3.2 1.7 1.7 2.7 3.0 2.7 3.8 3.4
## 2 15.2 4.3 4.7 2.3 1.5 3.8 4.0 4.0 3.4 3.4 2.1 3.2 2.7 3.0 4.9 2.3 1.4
## 8 13.4 2.7 3.3 3.2 3.7 3.2 2.2 4.4 3.0 3.6 2.8 1.4 2.8 2.0 2.6 3.4 3.1
## 4 12.7 2.9 3.5 2.2 3.9 3.6 3.0 8.4 2.9 2.4 2.1 1.7 2.6 3.0 3.2 2.9 3.6
## 5 13.0 3.4 3.6 1.9 3.2 3.3 2.9 4.3 2.8 2.1 1.7 2.8 2.8 8.4 3.4 2.4 2.1
## 6 13.0 2.2 2.7 2.2 2.2 2.5 1.4 3.0 1.3 1.9 2.0 1.6 1.9 2.1 2.1 2.4 1.7
## 7 8.5 2.7 2.8 2.5 2.6 2.0 1.7 1.9 2.6 2.6 2.6 2.1 3.4 2.4 8.0 2.0 1.4 
## 8 12.3 3.0 8.0 1.4 2.9 2.7 2.6 3.6 1.9 1.8 3.7 4.1 2.1 2.8 2.8 2.9 1:
## 9 12.5 2.9 3.1 3.6 2.5 1.7 2.8 2.4 1.7 2.3 3.6 2.7 3.0 3.7 3.6 ' 1.3 2.0
## > 10 14.9 3.7 3.3 2.3 1.9 3.0 3.3 2.2 2.0 2.4 3.8 3.0 2.5 3.4 4.0 1.9 1? '
##  s-u. My;
## Kw

# only find decimal numbers
eng = tesseract(options=list(tessedit_char_whitelist="0123456789."))
# results are not repeatable, so do it a couple of times
d2=ocr("empire1.jpg",engine=eng)
cat(d2)
# cut and paste here, cleanup
d2=
"1  14.8 2.7 2.4 3.8 2.9 3.4 2.8 4.5 2.6 3.2 1.7 1.7 2.7 3.0 2.7 3.8 3.4
2  15.2 4.3 4.7 2.3 1.5 3.8 4.0 4.0 3.4 3.4 2.1 3.2 2.7 3.0 4.9 2.3 1.4
8  13.4 2.7 3.3 3.2 3.7 3.2 2.2 4.4 3.0 3.6 2.8 1.4 2.8 2.0 2.6 3.4 3.1
4  12.7 2.9 3.5 2.2 3.9 3.6 3.0 3.4 2.9 2.4 2.1 1.7 2.6 3.0 3.2 2.9 3.6
5  13.0 3.4 3.6 1.9 3.2 3.3 2.9 4.3 2.8 2.1 1.7 2.8 2.8 3.4 3.4 2.4 2.1
6  13.0 2.2 2.7 2.2 2.2 2.5 1.4 3.0 1.3 1.9 2.0 1.6 1.9 2.1 2.1 2.4 1.7
7   8.5 2.7 2.8 2.5 2.6 2.0 1.7 1.9 2.6 2.6 2.6 2.1 3.4 2.4 3.0 2.0 1.4  
8  12.3 3.0 3.0 1.4 2.9 2.7 2.6 3.6 1.9 1.8 3.7 4.1 2.1 2.8 2.8 2.9 1.1 
9  12.5 2.9 3.1 3.6 2.5 1.7 2.8 2.4 1.7 2.3 3.6 2.7 3.0 3.7 3.6 1.3 2.0
10 14.9 3.7 3.3 2.8 1.9 3.0 3.3 2.2 2.0 2.4 3.8 3.0 2.5 3.4 4.0 1.9 1.7"

# in the past, I have used ocr tools that confuse I and 1, S5 2Z 0O depending
# on the font, clarity of printing, clarity of scan, etc.
# ocr confuses sees '3' and outputs '8' here
d2 = scan(text=d2)
d2 = matrix(d2, nrow=20, byrow=TRUE)
d2 = d2[,-1] # row numbers

lib(lattice)
lib(pals)
levelplot(t(d2), col.regions=parula)
levelplot(t(d2))

ll <- d2
rownames(ll) <- 1:20
colnames(ll) <- 1:8
ll <- melt(ll)
names(ll) <- c('row','col','yield')

ll$year <- 1934
kadam.millet <- rbind(kadam.millet,ll)

kadam.millet <- kadam.millet[,c('year','row','col','yield')]


# ----------------------------------------------------------------------------

dat <- subset(love.cotton.uniformity, col > 1)
if(require(desplot)){
  desplot(yield ~ col*row, dat, flip=TRUE,
          main="love.cotton.uniformity")
}

OCR of old documents is a way to reduce typing, but not eliminate typing.  Still need to check every value.

d2="48.4 41.6 54.0 47.6 51.6 42.4 48.4 52.8
44.8 46.0 55.2 45.6 48.4 39.6 44.4 56.0
44.4 34.4 46.0 48.0 40.0 36.4 38.8 52.8
48.8 42.8 44.4 40.4 41.2 39.6 41.6 54.0
50.4 38.4 45.6 44.0 32.4 42.4 41.6 44.0
48.4 43.2 44.4 44.4 39.2 33.6 36.4 42.0
59.6 53.6 50.8 42.4 39.2 36.8 43.6 43.2
59.6 45.2 38.4 38.8 33.6 38.8 36.8 44.8
43.6 41.2 38.0 37.6 37.6 34.0 36.0 41.2
54.4 43.6 34.8 43.6 39.2 36.0 43.2 48.0
42.4 42.4 44.8 39.6 39.2 30.8 35.2 46.8
44.4 32.8 36.8 44.8 27.2 27.2 37.6 39.2
33.6 42.0 34.8 41.2 32.0 38.4 35.2 43.6
38.4 35.2 33.6 36.4 34.4 30.8 34.8 39.6
34.0 41.2 41.6 32.8 31.2 38.8 41.2 43.2
37.6 49.6 36.8 40.4 37.2 36.8 36.4 40.8
43.2 40.0 40.0 40.8 42.4 37.6 44.8 45.6
40.8 40.8 48.0 45.6 58.8 50.0 48.4 52.8
33.2 29.2 40.4 40.0 41.2 46.4 46.8 44.0
48.0 46.8 41.6 46.8 50.8 55.2 50.8 38.8"
