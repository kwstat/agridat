\name{yan.winterwheat}
\alias{yan.winterwheat}
\docType{data}
\title{
  Multi-environment trial of Winter Wheat in Ontario
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

  Used with permission of Weikai Yan.
}

\references{
  Weikai Yan and Manjit S. Kang and Baoluo Ma and Sheila Woods, 2007,
  GGE Biplot vs. AMMI Analysis of Genotype-by-Environment Data,
  \emph{Crop Science}, 2007, 47, 641--653.
}

\examples{

require("reshape2")
mat <- melt(yan.winterwheat, id.var=c('gen','env'))
mat <- acast(mat, gen~env)

mat.sc <- scale(mat)

# Environment-standardized GGE biplot
biplot(princomp(mat.sc), main="yan.winterwheat")

}
