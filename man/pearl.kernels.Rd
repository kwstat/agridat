\name{pearl.kernels}
\alias{pearl.kernels}
\docType{data}
\title{
  Counts of yellow/white and sweet/starchy maize kernels by 15 observers
}
\description{
  Counts of yellow/white and sweet/starchy kernels on each of 4 maize
  ears by 15 observers.
}

\format{
  A data frame with 59 observations on the following 6 variables.
  \describe{
    \item{\code{ear}}{Factor for ear 8, 9, 10, 11}
    \item{\code{obs}}{Factor for observer, 1-15}
    \item{\code{ys}}{Number of yellow starchy kernels}
    \item{\code{yt}}{Yellow sweet}
    \item{\code{ws}}{White starchy}
    \item{\code{wt}}{White sweet}
  }
}
\details{
  An ear of white sweet corn was crossed with an ear of yellow starchy
  corn.  The F1 kernels of the cross were grown and a sample of four
  ears was harvested. The F2 kernels of these ears were classified by
  each of 15 observers into white/yellow and sweet/starchy.

  By Mendelian genetics, the kernels should occur in the
  ratio 9 yellow starch, 3 white starch, 3 yellow sweet,
  1 white sweet.

  The observers had the following positions:
  \tabular{ll}{
    1 \tab Plant pathologist \cr
    2 \tab Asst plant pathologist \cr
    3 \tab Prof agronomy \cr
    4 \tab Asst prof agronomy \cr
    5 \tab Prof philosophy \cr
    6 \tab Biologist \cr
    7 \tab Biologist \cr
    8 \tab Asst biologist \cr
    9 \tab Computer \cr
    10 \tab Farmer \cr
    11 \tab Prof plant physiology \cr
    12 \tab Instructor plant physiology \cr
    13 \tab Asst plant physiology \cr
    14 \tab Asst plant physiology \cr
    15 \tab Prof biology \cr
  }

}
\source{
  Raymond Pearl, 1911.
  The Personal Equation In Breeding Experiments Involving Certain
  Characters of Maize, Biol. Bull., 21, 339-366.
  \url{http://www.biolbull.org/cgi/reprint/21/6/339.pdf}
}

\examples{

data(pearl.kernels)
dat <- pearl.kernels

require(lattice)
xyplot(ys+yt+ws+wt~obs|ear, dat, type='l', as.table=TRUE,
       auto.key=list(columns=4),
       main="pearl.kernels", xlab="observer",ylab="kernels",
       layout=c(4,1), scales=list(x=list(rot=90)))

# Test hypothesis that distribution is 'Mendelian' 9:3:3:1
dat$pval <- apply(dat[, 3:6], 1, function(x)
                  chisq.test(x, p=c(9,3,3,1)/16)$p.val)
dotplot(pval~obs|ear, dat, layout=c(1,4), main="pearl.kernels",
        ylab="P-value for test of 9:3:3:1 distribution")

}

