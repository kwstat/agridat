# paine.multicrop.R

# Source: P. Paine (1940).
# An examination of field 3 with a view to determining its fertility trend
# by a study of a sequence of crop yields and soil conditions from a number
# of contiguous and fixed plots, Seson 1939-1940.
# Dissertation. The University of the West Indies.
# http://hdl.handle.net/2139/43045

# Decided not to use this data because the heatmap of Woolly Pyrol 1 yields
# that I created does not quite match the heatmap given in Appendix I.
# Especially the leftmost plots in the 4th and 5th row.

Experiments on Field III (formerly St. Augustine Estates), Trinidad.
Plot size 33 feet by 33 feet = 1/40 acre. Discard areas between plots running North and south are 4 feet wide, with a central discard area of 10 feet. Discards running East and West are 7 feet with one in the middle of 14 feet. Planted Jun 1939. Harvested Aug 1939 on 3 days.
1. Aug 1 - Aug 2, at night, G-K x 25-26.
2. Aug 2 - Aug 3, at night, A-F x 25-26, A-K x 21-24, A-B x 19-20.
3. Aug 4, daytime, C-K x 19-20, A-K x 16-18.
Plots harvested during the day were reduced by 5 percent to account for moisture.

Two crops of Woolly Pyrol were grown.
Pg 9, crop history.
Pg 17, field III layout.
Pg 19. Yield, woolly pyrol 1
Pg 23. Yield, woolly pyrol 2
Pg 34. Plant height
Pg 37. Plant number
Pg 38. Cob number. Block 26 was bad data.
Pg 39. Plant weight, cob weight

# ----------------------------------------------------------------------------

libs(readxl,reshape2)
setwd("c:/x/rpack/agridat/data-raw")

d1 <- read_excel("paine.multicrop.xlsx","WoollyPyrol1", col_names=FALSE)
d2 <- read_excel("paine.multicrop.xlsx","WoollyPyrol2", col_names=FALSE)
d3 <- read_excel("paine.multicrop.xlsx","PlantHeight", col_names=FALSE)
d4 <- read_excel("paine.multicrop.xlsx","Plants", col_names=FALSE)
d5 <- read_excel("paine.multicrop.xlsx","Cobs", col_names=FALSE)
d6 <- read_excel("paine.multicrop.xlsx","PlantWt", col_names=FALSE)
d7 <- read_excel("paine.multicrop.xlsx","CobWt", col_names=FALSE)
d1 <- as.matrix(d1)
d2 <- as.matrix(d2)
d3 <- as.matrix(d3)
d4 <- as.matrix(d4)
d5 <- as.matrix(d5)
d6 <- as.matrix(d6)
d7 <- as.matrix(d7)
colnames(d1) <- colnames(d2) <- colnames(d3) <- colnames(d4) <- colnames(d5) <-
  colnames(d6) <- colnames(d7) <- 1:10
rownames(d1) <- rownames(d2) <- rownames(d3) <- rownames(d4) <- rownames(d5) <-
  rownames(d6) <- rownames(d7) <- 16:26
d1 <- melt(d1)
d2 <- melt(d2)
d3 <- melt(d3)
d4 <- melt(d4)
d5 <- melt(d5)
d6 <- melt(d6)
d7 <- melt(d7)
names(d1) <- c('row','col','woolly1')
names(d2) <- c('row','col','woolly2')
names(d3) <- c('row','col','plantht')
names(d4) <- c('row','col','plantnum')
names(d5) <- c('row','col','cobs')
names(d6) <- c('row','col','plantwt')
names(d7) <- c('row','col','cobwt')

paine.multi.uniformity <- merge(merge(merge(merge(merge(merge(d1,d2),d3),d4),d5),d6),d7)

# ----------------------------------------------------------------------------

mycol <- brewer.pal(10, "Spectral")
# mycol <-  c("#9E0142", "#D53E4F", "#F46D43", "#FDAE61", "#FEE08B", "#E6F598", "#ABDDA4",
#   "#66C2A5", "#3288BD", "#5E4FA2")

dat <- paine.multi.uniformity
sd(dat$woolly1) # 60.7
sd(dat$plantnum) # 36
sd(dat$cobs) # 26
sd(dat$plantwt) # 14.5
sd(dat$cobwt) # 38.6

if(require(desplot)){
  # Paine appendix 1
  desplot(woolly1 ~ col*row, dat, flip=TRUE,
          col.regions=mycol, tick=TRUE,
          main="paine.multi.uniformity - Woolly Pyrol 1",
          midpoint="midrange")
  # Paine appendix 2
  desplot(woolly2 ~ col*row, dat, flip=TRUE,
          col.regions=mycol, tick=TRUE,
          main="paine.multi.uniformity - Woolly Pyrol 2",
          midpoint="midrange")
  desplot(plantwt ~ col*row, dat, flip=TRUE,
          col.regions=mycol, tick=TRUE,
          main="paine.multi.uniformity - Plant wt",
          midpoint="midrange")
  desplot(plantnum ~ col*row, dat, flip=TRUE,
          col.regions=mycol, tick=TRUE,
          main="paine.multi.uniformity - Plant number",
          midpoint="midrange")
  desplot(cobs ~ col*row, dat, flip=TRUE,
          col.regions=mycol, tick=TRUE,
          main="paine.multi.uniformity - Cobs",
          midpoint="midrange")
}
