# smith.wheat.r

# This uniformity trial is quite small...15 feet by 36 feet!
# Although Smith's paper is part of the core literature of uniformity
# trials, because the field is so small and a plot of the field is difficult
# to match to Smith's paper, this data is not used in the agridat package.

# The code/data below are from 
# http://www.stat.uchicago.edu/~pmcc/reml/

# Fairfield Smith (1938) wheat yields on 1080 plots
# Journal of Agricultural Science (1938): Data unpublished
#
# According to FS, copies of the data were lodged at the
# Museum of Natural History, London
# and in the library of the CSIRO Dept of Botany at Canberra in 1938.
# Attempts were made in 2003 to retrieve these, but the library staff
# were unable to trace either copy.
# Fortunately the experiment was included in Cochran's (1937, JRSS) catalogue
# of uniformity trials and the data were kept in the library at Rothamsted.
# This electronic version was obtained from the Rothamsted Library in November 2003.
# The Rothamsted electronic copy was made in Fall 2003, from the original,
# which was in such a fragile state that it was deemed unsuitabe for photocopying.
# It is not identical to the data analyzed by FS:
# the summary statistics published by FS suggest a few typos.
#   Peter McCullagh
#   David Clifford
#   Chicago, December 2003

metre <- 1.0
inch <- 2.54/100 * metre
foot <- 12 * inch
kilo <- 1.0
pound <- kilo / 2.204622
gram <- kilo/1000

rowwidth <- 0.5 * foot
colwidth <- 1.0 * foot
rowsep <- 0 * foot
colsep <- 0 * foot
nrows <- 30
ncols <- 36
n <- nrows*ncols

setwd("c:/x/rpack/agridat/data-unused")
yield <- t(matrix(scan("smith.wheat1.dat"), ncols, nrows))	# yield per plot
ears <- t(matrix(scan("smith.wheat2.dat"), ncols, nrows))	# No of ears per plot

yield <- matrix(yield, n, 1) * 0.1  # to convert yield to grams
row <- gl(nrows, 1, n)
col <- gl(ncols, nrows, n)

# It is difficult to match the Figure 1 of Smith's paper
dat=data.frame(yield=yield,row=row, col=col)
desplot(yield ~ col*row, data=dat, flip=TRUE, col.regions=gray(100:20/100),midpoint=NULL)
#desplot(yield ~ row*col, data=dat, flip=TRUE, col.regions=gray(100:0/100))
contourplot(yield ~ col*row, data=dat, cuts=6, region=TRUE, col.regions=gray(100:20/100))

# The rest of this code is by Clifford/McCullagh

one <- matrix(rep(1,n), n, 1)
x1 <- as.numeric(row)*rowwidth
x2 <- as.numeric(col)*colwidth
dx1 <- x1 %*% t(one) - one %*% t(x1)
dx2 <- x2 %*% t(one) - one %*% t(x2)
dx <- sqrt(dx1^2 + dx2^2)
ydiff <- yield %*% t(one) - one %*% t(yield)
dx <- as.vector(dx)
pos <- (dx < 3) & (dx > 0)
dx <- dx[pos]
ydiff <- as.vector(ydiff)[pos]

plot(lowess(dx, ydiff^2, f=1/5), xlab="plot separation in m.",
	ylab="variance of yield difference", type="l")
title(main="smoothed variogram for Fairfield Smith wheat yield data")

boxplot(abs(ydiff) ~ trunc(dx*10))
plot(lowess(dx, ydiff^2))
#########################################################)

library(spatialCovariance)
info <- precompute(nrows,ncols,rowwidth,colwidth,rowsep,colsep)
V <- computeV(info,class="matern",params=c(0.1,0.5))  
#
V <- computeV(info,"ldt")
fit0 <- regress(y, one, ~V+row+col, tol=1.0e-5)
V1 <- computeV(info, class="bess0", params=c(1.4), cat.level=1)
fit <- regress(y, one, ~V1+row+col)
fit$llik
V1 <- computeV(info, class="bess0", params=c(1.75), cat.level=1)
fit <- regress(y, one, ~V1+row+col, start=fit$sigma)
fit$llik
V1 <- computeV(info, class="bess0", params=c(2.0), cat.level=1)
fit <- regress(y, one, ~V1+row+col)
fit$llik
area <- rowwidth*colwidth
factor <- c(1/area, 1/area^2, 1,1)
fit$sigma * factor

value <- rep(0, 0)
for(nra in c(1,2,3,5,6)){
for(nca in c(1,2,3,4,6,9)){
rowa <- gl(nrows/nra, nra, n)
cola <- gl(ncols/nca, nca*nrows, n)
bsize <- nra*nca
rank <- n / bsize - 1
Xa <- model.matrix(~rowa-1)
Br <- Xa %*% t(Xa) / (nra*ncols) - 1/n
Xa <- model.matrix(~cola-1)
Bc <- Xa %*% t(Xa) / (nca*nrows) - 1/n
Xa <- model.matrix(~rowa:cola-1)
Brc <- Xa %*% t(Xa)/bsize - 1/n
Ba <- Brc - Br - Bc
Ov  <- t(y) %*% Ba %*% y / (rank*area)
Ev0 <- sum(Ba * fit0$Sigma) / (rank*area)
Ev1 <- sum(Ba * fit$Sigma) / (rank*area)
Ovr   <- t(y) %*% Br %*% y / ((nrows/nra)*area)
Evr0 <- sum(Br * fit0$Sigma) / ((nrows/nra)*area)
Evr1 <- sum(Br * fit$Sigma) / ((nrows/nra)*area)
Ovc   <- t(y) %*% Bc %*% y / ((ncols/nca)*area)
Evc0 <- sum(Bc * fit0$Sigma) / ((ncols/nca)*area)
Evc1 <- sum(Bc * fit$Sigma) / ((ncols/nca)*area)
value <- c(value, nra, nca, Ov, Ev0, Ev1, Ovr, Evr0, Evr1, Ovc, Evc0, Evc1)
}
}
value <- matrix(value, length(value)/11, 11, byrow=T)
Ov <- value[,3]
Ev0 <- value[,4]
Ev1 <- value[,5]
plot(Ev, Ov)
points(Ev, Ev, type="l")
value <- cbind(value, Ov/Ev)
Ov <- matrix(Ov, 5, 6, byrow=T)
Ev0 <- matrix(Ev0, 5, 6, byrow=T)
Ev1 <- matrix(Ev1, 5, 6, byrow=T)

u <- (1:10)/100
power <- rep(0, 9)
l <- rep(0, 9)
for(i in 0:8){
lambda <- 2^i/5
v <- 1 - lambda * u * log(u)
power[i+1] <- glm(log(v)~log(u))$coef[2]
l[i] <- log(1+lambda)
}
plot(l, power)
