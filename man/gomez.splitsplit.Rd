\name{gomez.splitsplit}
\alias{gomez.splitsplit}
\docType{data}
\title{
  Split-split-plot experiment of rice
}

\description{
  Grain yield of three varieties of rice grown in a split-split plot
  arrangement with 3 reps, nitrogen level as the main plot, management
  practice as the sub-plot, and rice variety as the sub-sub plot.
}


\format{
  A data frame with 135 observations on the following 7 variables.
  \describe{
    \item{\code{rep}}{block, 3 levels}
    \item{\code{nitro}}{nitrogen fertilizer, in kilograms/hectare}
    \item{\code{management}}{plot management}
    \item{\code{gen}}{genotype/variety of rice}
    \item{\code{yield}}{yield}
    \item{\code{col}}{column position in the field}
    \item{\code{row}}{row position in the field}
  }

  Used with permission of Kwanchai Gomez.
}

\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  Statistical Procedures for Agricultural Research.
  Wiley-Interscience.
  Page 143.
}
\references{
  H. P. Piepho, R. N. Edmondson. (2018).
  A tutorial on the statistical analysis of factorial experiments
  with qualitative and quantitative treatment factor levels.
  Jour Agronomy and Crop Science, 8, 1-27.
  https://doi.org/10.1111/jac.12267
}

\examples{
\dontrun{

library(agridat)

data(gomez.splitsplit)
dat <- gomez.splitsplit
dat$nf <- factor(dat$nitro)

libs(desplot)
desplot(dat, nf ~ col*row,
        # aspect unknown
        out1=rep, col=management, num=gen, cex=1,
        main="gomez.splitsplit")
desplot(dat, yield ~ col*row,
        # aspect unknown
        out1=rep, main="gomez.splitsplit")


libs(HH)
position(dat$nf) <- c(0,50,80,110,140)
interaction2wt(yield~rep+nf+management+gen, data=dat,
               main="gomez.splitsplit",
               x.between=0, y.between=0,
               relation=list(x="free", y="same"),
               rot=c(90,0), xlab="",
               par.strip.text.input=list(cex=.7))


# AOV.  Gomez page 144-153
m0 <- aov(yield~ nf * management * gen + Error(rep/nf/management),
         data=dat)
summary(m0) # Similar to Gomez, p. 153.

}
}

