\name{bancroft.peanut.uniformity}
\alias{bancroft.peanut.uniformity}
\docType{data}
\title{
  Uniformity trial of peanuts
}
\description{
  Uniformity trial of peanuts in Alabama, 1946.
}
\usage{data("bancroft.peanut.uniformity")}
\format{
  A data frame with 216 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, pounds}
    \item{\code{block}}{block}
  }
}
\details{
  The data are obtained from two parts of the same field, located at
  Wiregrass Substation, Headland, Alabama, USA.  Each part had 18 rows,
  3 feet wide, 100 feet long. Plots were harvested in 1946. Green
  weights in pounds were recorded.

  Each plot was 16.66 linear feet of row and 3 feet in width, 50 sq feet.

  Field width: 6 plots * 16.66 feet = 100 feet

  Field length: 18 plots * 3 feet = 54 feet

  Conclusions:
  Based on the relative efficiencies, increasing the size of the plot
  along the row is better than across the row.  Narrow, rectangular
  plots are more efficient. 
}
\source{
  Bancroft, T. A. et a1., (1948).
  "Size and Shape of Plots and Distribution of Plot Yield for Field Experiments with Peanuts."
  Alabama Agricultural Experiment Station Progress Report, sec. 39.
  Table 4, page 6.
  https://aurora.auburn.edu/bitstream/handle/11200/1345/0477PROG.pdf;sequence=1
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
data(bancroft.peanut.uniformity)
dat <- bancroft.peanut.uniformity
  
# match means Bancroft page 3
## dat %>% group_by(block) %>% summarize(mn=mean(yield))
## # A tibble: 2 x 2
##   block    mn
##   <chr> <dbl>
## 1 B1     2.46
## 2 B2     2.05
  
libs(desplot)
desplot(yield ~ col*row|block, dat,
        flip=TRUE, aspect=(18*3)/(6*16.66), # true aspect
        main="bancroft.peanut.uniformity")

}  
}
\keyword{datasets}
