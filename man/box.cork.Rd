\name{box.cork}
\alias{box.cork}
\docType{data}
\title{Weight of cork samples on four sides of trees}
\description{
The cork datagives the weights of cork borings of the trunk for 28 trees
on the north (N), east (E), south (S) and west (W) directions.
}

\format{
Data frame with 28 observations on the following 5 variables.
\describe{
  \item{\code{tree}}{tree number}
  \item{\code{N}}{weight of cork deposit (centigrams), north direction}
  \item{\code{E}}{east direction}
  \item{\code{S}}{south direction}
  \item{\code{W}}{west direction}
}
}

\source{
  
  C.R. Rao (1948).
  Tests of significance in multivariate analysis. 
  \emph{Biometrika}, 35, 58-79.
  \url{http://doi.org/10.2307/2332629}

}

\references{
  K.V. Mardia, J.T. Kent and J.M. Bibby (1979) \emph{Multivariate Analysis},
  Academic Press.

  Russell D Wolfinger, (1996).
  Heterogeneous Variance: Covariance Structures for Repeated Measures.
  \emph{Journal of Agricultural, Biological, and Environmental
    Statistics}, 1, 205-230.
}

\examples{

data(box.cork)
dat <- box.cork

require(lattice)
splom(dat[,2:5], pscales=3,
  prepanel.limits = function(x) c(25,100),
  main="box.cork", xlab="Cork yield on side of tree",
  panel=function(x,y,...){
    panel.splom(x,y,...)
    panel.abline(0,1,col="gray80")
})

\dontrun{
## Each tree is one line
require(plotrix)
radial.plot(dat[, 2:5], start=pi/2, rp.type='p', clockwise=TRUE,
            radial.lim=c(0,100), main="box.cork",
            lwd=2, labels=c('North','East','South','West'),
            line.col=rep(c("royalblue","red","#009900","dark orange",
              "#999999","#a6761d","deep pink"), length=nrow(dat)))

require(reshape2)
dat$tree <- factor(dat$tree)
d2 <- melt(dat)
names(d2) <- c('tree','dir','y')

require(asreml)
d2 <- d2[order(d2$tree, d2$dir), ]

# Unstructured covariance matrix
m1 <- asreml(y~dir, data=d2, rcov=~tree:us(dir, init=rep(200,10)))
## Note: 'rcor' is a personal function to extract the correlation
## round(rcor(m1)$dir, 2)
##         N      E      S      W
##  N 290.41 223.75 288.44 226.27
##  E 223.75 219.93 229.06 171.37
##  S 288.44 229.06 350.00 259.54
##  W 226.27 171.37 259.54 226.00

# Factor Analytic with different specific variances
# Note: Wolfinger used a common diagonal variance
m2 <- update(m1, rcov=~tree:facv(dir,1))
## round(rcor(m2)$dir, 2)
##        N      E      S      W
## N 290.42 209.46 291.82 228.44
## E 209.46 219.95 232.85 182.28
## S 291.82 232.85 350.00 253.95
## W 228.44 182.28 253.95 225.99
}
}
\keyword{datasets}
