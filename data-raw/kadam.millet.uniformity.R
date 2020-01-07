# kadam.millet.uniformity.r
# Time-stamp: <20 Jul 2017 20:15:53 c:/x/rpack/agridat/data-done/kadam.millet.uniformity.r>



# similar to Kadam fig 1
dat1 <- subset(kadam.millet.uniformity, year==1933)
if(require(desplot)){
  desplot(yield ~ col*row, dat1, flip=TRUE,
          aspect=(10*33)/(8*16.5), # true aspect
          main="kadam.millet.uniformity 1933")
}

dat2 <- subset(kadam.millet.uniformity, year==1934)
if(require(desplot)){
  desplot(yield ~ col*row, dat2, flip=TRUE,
          aspect=(20*16.5)/(8*16.5), # true aspect
          main="kadam.millet.uniformity 1934")
}
