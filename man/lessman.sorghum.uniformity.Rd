\name{lessman.sorghum.uniformity}
\alias{lessman.sorghum.uniformity}
\docType{data}
\title{
  Uniformity trial of sorghum
}
\description{
  Uniformity trial of sorghum at Ames, Iowa, 1959.
}
\usage{data("lessman.sorghum.uniformity")}
\format{
  A data frame with 2640 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, ounces}
  }
}
\details{
  
  The uniformity trial was conducted at the Agronomy Farm at Ames, Iowa,
  in 1959.  The field was planted to grain sorghum in rows spaces 40
  inches apart, thinned to a stand of three inches between plants.  The
  entire field was 48 rows (40 inches apart), each 300 feet long and
  harvested in 5-foot lengths.  Threshed grain was dried to 8-10 percent
  moisture before weighing. Weights are ounces.  Average yield for the
  field was 95.3 bu/ac.

  Field width: 48 rows * 40 inches / 12in/ft = 160 feet

  Field length: 300 feet
  
  Plot yields from the two outer rows on each side of the field were
  omitted from the analysis.

  CV values from this data do not quite match Lessman's value.  The
  first page of Table 17 was manually checked for correctness and there
  were no problems with the optical character recognition (other than
  obvious errors like 0/o).
}
\source{
  Lessman, Koert James, (1962)
  \emph{Comparisons of methods for testing grain yield of sorghum}
  Retrospective Theses and Dissertations. Paper 2063. Appendix Table 17.
}
\references{
  None.
}
\examples{

data(lessman.sorghum.uniformity)
dat <- lessman.sorghum.uniformity

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          aspect=300/160, tick=TRUE, flip=TRUE, # true aspect
          main="lessman.sorghum.uniformity")
}

# Omit outer two columns (called 'rows' by Lessman)
dat <- subset(dat, col > 2 & col < 47)
nrow(dat)
var(dat$yield) # 9.09
sd(dat$yield)/mean(dat$yield) # CV 9.2%

if(require(reshape2) & require(agricolae)){
  dmat <- acast(dat, row~col, value.var='yield')
  index.smith(dmat) # Similar to Lessman Table 1
  # Lessman said that varying the width of plots did not have an appreciable
  # effect on CV, and optimal row length was 3.2 basic plots, about 15-20
}

}
\keyword{datasets}
