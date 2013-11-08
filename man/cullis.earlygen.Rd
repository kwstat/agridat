\name{cullis.earlygen}
\alias{cullis.earlygen}
\docType{data}
\title{
  Early generation variety trial in wheat
}
\description{
  Early generation variety trial in wheat
}

\format{
  A data frame with 670 observations on the following 5 variables.
  \describe{
    \item{\code{gen}}{genotype factor}
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{entry}}{entry (genotype) number}
    \item{\code{yield}}{yield of each plot, kg/ha}
    \item{\code{weed}}{weed score}
  }
}
\details{
  Experiment conducted at Tullibigeal, New South Wales, Australia in
  1987-88.  In each row, every 6th plot was the variety 'Kite'.  Six
  other standard varieties were randomly interspersed over the trial.
  Each plot was 15m x 1.8m.

  The 'weed' variable is a visual score, 0 = no weeds, 10 = 100 percent
  weeds.

  The replicated check variety was numbered 526. A further 6 replicated
  commercially available varieties (numbered 527 to 532) were also
  randomly assigned to plots with between 3 to 5 plots of each. The aim
  of these trials is to identify and retain the top, say 20 percent of
  lines for further testing. Cullis et al. (1989) presented an analysis
  of early generation variety trials that included a one-dimensional
  spatial analysis.  Below, a two-dimensional spatial analysis is
  presented.

  Note: The 'row' and 'col' variables are as in the link below (switched
  compared to the paper by Cullis et al.)
}
\source{
  Brian R. Cullis, Warwick J. Lill, John A. Fisher, Barbara J. Read and
  Alan C. Gleeson (1989).
  A New Procedure for the Analysis of Early Generation Variety Trials.
  \emph{Journal of the Royal Statistical Society. Series C (Applied
    Statistics)}, 38, 361-375.
  \url{http://www.jstor.org/stable/2348066}.
}
\references{
  \url{http://www.vsni.co.uk/software/asreml/htmlhelp/asreml/xwheat.htm}.
}
\examples{

dat <- cullis.earlygen

# Show field layout of checks.  Cullis Table 1.
dat$check <- ifelse(dat$entry < 8, dat$entry, NA)
desplot(yield ~ col*row, dat, main="cullis.earlygen (yield)",
        col="check", cex=1, flip=TRUE)

desplot(weed ~ col*row, dat, main="cullis.earlygen (weed)", flip=TRUE)
bwplot(yield ~ weed, dat, horizontal=FALSE, main="cullis.earlygen")

\dontrun{
  require(asreml)
  # Start with the standard AR1xAR1 analysis
  dat <- transform(dat, xf=factor(col), yf=factor(row))
  dat <- dat[order(dat$xf, dat$yf),]
  m2 <- asreml(yield ~ weed, data=dat, random= ~gen,
               rcov = ~ ar1(xf):ar1(yf))

  # Variogram suggests a polynomial trend
  m3 <- update(m2, fixed= yield~weed+pol(col,-1))

  # Now add a nugget variance
  m4 <- update(m3, random= ~ gen + units)

  summary(m4)$varcomp
  ##          effect  component std.error z.ratio           con
  ##     gen!gen.var   73770    10420         7.1      Positive
  ## units!units.var   30440     8074         3.8      Positive
  ##      R!variance   54720    10630         5.1      Positive
  ##        R!xf.cor       0.84     0.045    19   Unconstrained
  ##        R!yf.cor       0.38     0.115     3.3 Unconstrained

  # Predictions from models m3 and m4 are non-estimable.  Why?
  # Use model m2 for predictions
  predict(m2)$pred
  ##         gen predicted.value standard.error est.status
  ## 1    Banks         2723.534       93.14633  Estimable
  ## 2    Eno008        2981.057      162.85053  Estimable
  ## 3    Eno009        2978.009      161.56930  Estimable
  ## 4    Eno010        2821.399      153.96697  Estimable
  ## 5    Eno011        2991.610      161.53308  Estimable
  ## 6    Eno012        2771.148      162.21897  Estimable

}

}
\keyword{datasets}
