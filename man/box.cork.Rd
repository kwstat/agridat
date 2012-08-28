\name{box.cork}
\alias{box.cork}
\docType{data}
\title{Weight of cork samples on four sides of trees}
\description{
The cork datagives the weights of cork borings of the trunk for 28 trees
on the north (N), east (E), south (S) and west (W) directions.
}
\usage{data(box.cork)}
\format{
Data frame with 28 observations on the following 5 variables.
\describe{
  \item{\code{tree}}{Tree number}
  \item{\code{N}}{Weight of cork deposit (centigrams), north direction}
  \item{\code{E}}{east direction}
  \item{\code{S}}{south direction}
  \item{\code{W}}{west direction}
}
}

\source{
  C.R. Rao (1948) \emph{Tests of significance in multivariate analysis}. Biometrika, 35, 58-79. 
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

dat <- box.cork

pairs(dat[,2:5], xlim=c(25,100), ylim=c(25,100))

\dontrun{
require("plotrix")
radial.plot(dat[, 2:5], start=pi/2, rp.type='p', clockwise=TRUE,
            radial.lim=c(0,100),
            lwd=2, labels=c('North','East','South','West'),
            line.col=rep(c("royalblue","red","#009900","dark orange",
              "#999999","#a6761d","deep pink"), length=nrow(dat)))

require("reshape2")
dat$tree <- factor(dat$tree)
d2 <- melt(dat)
names(d2) <- c('tree','dir','y')

require("asreml")
d2 <- d2[order(d2$tree, d2$dir), ]

# Unstructured covariance matrix
m1 <- asreml(y~dir, data=d2, rcov=~tree:us(dir, init=rep(200,10)))
# round(rcor(m1)$dir,2) # 'rcor' is a personal function
#        N      E      S      W
# N 290.41 223.75 288.44 226.27
# E 223.75 219.93 229.06 171.37
# S 288.44 229.06 350.00 259.54
# W 226.27 171.37 259.54 226.00

# Factor Analytic with different specific variances
# Note: Wolfinger used a common diagonal variance
# m2 <- update(m1, rcov=~tree:facv(dir,1))
# round(rcor(m2)$dir,2)
}
}
\keyword{datasets}
