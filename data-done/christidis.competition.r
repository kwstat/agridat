

setwd("c:/x/rpack/agridat/data-raw/")
lib(readxl)
dat = read_excel("christidis.competition.xlsx")

christidis.competition <- dat
# ----------------------------------------------------------------------------

dat <- christidis.competition

# Match Christidis Table 2 means
# aggregate(yield ~ gen, aggregate(yield ~ gen+plot, dat, sum), mean)

# Each RCB block has 2 replicates of each genotype
# with(dat, table(block,gen))

if(require(lattice)){
  # Tall plants yield more
  # xyplot(yield ~ height|gen, data=dat)

  # Huge variation across field. Also heterogeneous variance.
  xyplot(yield ~ col, dat, group=gen, auto.key=list(columns=5),
         main="christidis.competition")
}

if(FALSE & require(lattice) & require(mgcv)){
  # Simple non-competition model
  m1 <- gam(yield ~ gen + s(col), data=dat)
  p1 <- as.data.frame(predict(m1, type="terms"))
  names(p1) <- c('geneff','coleff')
  dat2 <- cbind(dat, p1)
  dat2 <- transform(dat2, res=yield-geneff-coleff)
  xyplot(res ~  col, data=dat2, group=gen)

  }
