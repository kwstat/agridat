\name{montgomery.wheat.uniformity}
\alias{montgomery.wheat.uniformity}
\docType{data}
\title{
  Uniformity trial of wheat
}
\description{
  Uniformity trial of wheat at Nebraska Experiment Station, 1909.
}
\usage{data("montgomery.wheat.uniformity")}
\format{
  A data frame with 224 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, grams}
  }
}
\details{
  
  A field was sown to Turkey winter wheat in the fall of 1908.  The
  drill, 5.5 feet wide, was driven across the first series of 14 blocks,
  the boundaries of the blocks being later established.  Each series was
  sown the same way, no space was allowed between the blocks.
  Each block was 5.5 ft square.

  Montgomery (1913) has nice photos of various field experiments.

  Surface & Pearl (1916) give a simple method for adjusting yield due to
  fertility effects.
}
\source{
  
  E. G. Montgomery (1913).
  Experiments in wheat breeding: Experimental Error In The Nursery and
  Variation in Nitrogen and Yield.
  U.S. Dept of Agriculture, Bureau of Plant Industry, Bulletin 269.
  Figure 10, page 37.
  \url{http://doi.org/10.5962/bhl.title.43602}
}

\references{
  Surface & Pearl, (1916).
  A method of correcting for soil heterogeneity in variety tests.
  \emph{Journal of Agricultural Research}, 5, 22, 1039-1050.
  Figure 2.

}
\examples{
data(montgomery.wheat.uniformity)
dat <- montgomery.wheat.uniformity

# Montgomery figure 10, page 37.
if(require(desplot)){
desplot(yield ~ col*row, dat, text=yield,
        aspect=1, cex=1, shorten="none",
        main="montgomery.wheat.uniformity - observed yield")
}


# Surface & Pearl adjust yield for fertility effects.
# They calculate smoothed yield as (row sum)*(column sum)/(total)
# and subtract this from the overall mean to get 'deviation'.
# We can do the same thing using a linear model with rows and columns
# as factors, then predict yield to get the smooth trend.
# Corrected yield = observed - deviation = observed - (smooth-mean)

m1 <- lm(yield ~ factor(col) + factor(row), data=dat)
dev1 <- predict(m1) - mean(dat$yield)
# Corrected.  Similar (but not exact) to Surface, fig 2.
dat$correct <- round(dat$yield - dev1,0)
if(FALSE){
  require(desplot)
  desplot(yield ~ col*row, dat, main="observed")
  desplot(correct ~ col*row, dat, text=correct,
          cex=1, shorten="none",
          main="corrected")
  # Corrected yields are slightlty shrunk toward overall mean
  plot(correct~yield,dat, xlim=c(350,1000), ylim=c(350,1000))
  abline(0,1)
}
}
\keyword{datasets}
