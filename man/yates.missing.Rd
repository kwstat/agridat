\name{yates.missing}
\alias{yates.missing}
\docType{data}
\title{
  Factorial experiment with missing values
}
\description{
  Potato factorial experiment with missing values
}

\format{
  A data frame with 80 observations on the following 3 variables.
  \describe{
    \item{\code{trt}}{treatment factor with levels \code{0} \code{K}
      \code{N} \code{P} \code{NK} \code{KP} \code{NP} \code{NKP} }
    \item{\code{block}}{block, 10 levels}
    \item{\code{y}}{infection intensity}
  }
}
\details{
  The response variable \code{y} is the intensity of infection of potato
  tubers innoculated with \emph{Phytophthora Erythroseptica}.

  Yates (1933) presents an iterative algorithm to estimate missing
  values in a matrix, using this data as an example.
}

\source{
  F. Yates, 1933.
  The analysis of replicated experiments when the field results are incomplete. 
  \emph{Emp. J. Exp. Agric.}, 1, 129--142.
}

\references{
  Steel & Torrie, 1980, Principles and Procedures of Statistics,
  2nd Edition, page 212.
}

\examples{

data(yates.missing)
dat <- yates.missing

require(lattice)
bwplot(y ~ trt, data=dat,
       xlab="Treatment", ylab="Infection intensity",
       main="yates.missing")

if(require(reshape2)){
mat0 <- acast(dat[, c('trt','block','y')], trt~block,
               id.var=c('trt','block'), value.var='y')

# Use lm to estimate missing values.  The estimated missing values
# are the same as in Yates (1933)
m1 <- lm(y~trt+block, dat)
dat$pred <- predict(m1, new=dat[, c('trt','block')])
dat$filled <- ifelse(is.na(dat$y), dat$pred, dat$y)
mat1 <- acast(dat[, c('trt','block','pred')], trt~block,
               id.var=c('trt','block'), value.var='pred')
}

\dontrun{
# Another method to estimate missing values via PCA
require("pcaMethods") # From Bioconductor, not CRAN
m2 <- pca(mat0, method="nipals", center=FALSE, nPcs=3)
# mat2 <- m2@scores %*% t(m2@loadings)
mat2 <- tcrossprod(m2@scores, m2@loadings)

# Compare
ord <- c("0","N","K","P","NK","NP","KP","NKP")
print(mat0[ord,], na.print=".")
round(mat1[ord,] ,2)
round(mat2[ord,] ,2)

# SVD with 3 components recovers original data better
sum((mat0-mat1)^2, na.rm=TRUE)
sum((mat0-mat2)^2, na.rm=TRUE) # Smaller SS => better fit
}
}

