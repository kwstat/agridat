# magistad.pineapple.uniformity.R
# Time-stamp: <22 Mar 2018 11:25:35 c:/x/rpack/agridat/data-raw/magistad.pineapple.uniformity.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("magistad.pineapple.uniformity.xlsx")
dat <- dat0
head(dat)

magistad.pineapple.uniformity <- dat


# ----------------------------------------------------------------------------

dat <- magistad.pineapple.uniformity

dat %>% group_by(field) %>% summarize(mean=mean(number), sd=sd(weight), min=min(weight), max=max(weight))

#dat %>% group_by(field) %>% summarize(mean=mean(number), sd=sd(number))
# match table page 641
dat %>% group_by(field) %>% summarize(number=mean(number), weight=mean(weight)) %>% as.data.frame
if(require(desplot)){
  desplot(weight ~ col*row, subset(dat, field==19),
          aspect=300/39,
          main="magistad.pineapple.uniformity - field 19")
  desplot(weight ~ col*row, subset(dat, field==82),
          aspect=228/192,
          main="magistad.pineapple.uniformity - field 82")          
  desplot(weight ~ col*row, subset(dat, field==21),
          aspect=300/112.5,
          main="magistad.pineapple.uniformity - field 21")          
  desplot(weight ~ col*row, subset(dat, field==1),
          aspect=2400/48,
          main="magistad.pineapple.uniformity - field 1")          
}
