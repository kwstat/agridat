\name{yan.winterwheat}
\alias{yan.winterwheat}
\docType{data}
\title{
  Multi-environment trial of winter wheat in Ontario
}
\description{
  Yield of 18 varieties of winter wheat grown at 9 environments in
  Ontario in 1993.
}
\details{
  The yield is the mean of several reps, measured in metric tons per hectare.

  This data has often been used to illustrate GGE biplots.
}


\format{
  A data frame with 162 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{Genotype factor}
    \item{\code{env}}{Environment factor}
    \item{\code{yield}}{Yield in metric tons per hectare}
  }
}

\source{
  Weikai Yan and M.S. Kang.
  \emph{GGE biplot analysis: A graphical tool for breeders, geneticists, and
  agronomists}, 2002. CRC. Page 59.

  Weikai Yan and Nicholas A. Tinker. 2006.
  Biplot analysis of multi-environment trial data: Principles and
  applications. Table 1.

  Used with permission of Weikai Yan.
}

\references{
  
  Weikai Yan and Manjit S. Kang and Baoluo Ma and Sheila Woods, 2007,
  GGE Biplot vs. AMMI Analysis of Genotype-by-Environment Data,
  \emph{Crop Science}, 2007, 47, 641--653.
}

\examples{

data(yan.winterwheat)
dat <- yan.winterwheat

## require("reshape2")
## mat <- melt(dat, id.var=c('gen','env'))
## mat <- acast(mat, gen~env)
## mat.sc <- scale(mat)
## Environment-standardized GGE biplot
## biplot(princomp(mat.sc), main="yan.winterwheat - GGE biplot")

if(require(gge)){
m1 <- gge(yield ~ gen*env, data=dat)
biplot(m1, flip=c(0,1), title="yan.winterwheat - GGE biplot")
}

}
