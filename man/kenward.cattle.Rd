\name{kenward.cattle}
\alias{kenward.cattle}
\docType{data}
\title{
  Repeated measurement of weights of calves with two treatments.
}
\description{
  Repeated measurements of the weights of calves from a trial on the
  control of intestinal parasites.
}
\usage{data("kenward.cattle")}
\format{
  A data frame with 660 observations on the following 4 variables.
  \describe{
    \item{\code{animal}}{animal factor}
    \item{\code{trt}}{treatment factor, A or B}
    \item{\code{day}}{day, numberic, 0-133}
    \item{\code{weight}}{bodyweight, kg}
  }
}
\details{
  
  Grazing cattle can ingest larvae, which deprives the host animal of
  nutrients and weakens the immune system, affecting the growth of the
  animal.

  Two treatments A and B were applied randomly to 60 animals (30 each in
  two groups) to control the disease.
  Each animal was weighed 11 times at two-week intervals (one week
  between the final two measurements).

  Is there a difference in treatments, and when does that difference
  first become manifest?

}

\source{
  Kenward, Michael G. (1987).
  A Method for Comparing Profiles of Repeated Measurements.
  \emph{Applied Statistics}, 36, 296-308.  Table 1.
  \url{http://doi.org/10.2307/2347788}
}

\references{
  W. Zhang, C. Leng and C. Y. Tang (2015).
  A joint modelling approach for longitudinal studies
  \emph{J. R. Statist. Soc. B}, 77 (2015), 219--238.
  \url{http://doi.org/10.1111/rssb.12065}
}

\examples{

data(kenward.cattle)
dat <- kenward.cattle

require(lattice)
foo1 <- xyplot(weight~day|trt, data=dat, type='l', group=animal,
               main="kenward.cattle")
print(foo1)

\dontrun{
  # What model would be appropriate?  Just an idea...not final by any means.
  # Maybe a spline curve for each treatment, plus random deviations for each time
  require(asreml)
  m1 <- asreml(weight ~  1 + lin(day) +    # overall line
                 trt + trt:lin(day),       # different line for each treatment
               data=dat,
               random = ~ spl(day) +       # overall spline
                 trt:spl(day) +            # different spline for each treatment
                 dev(day) + trt:dev(day) ) # non-spline deviation at each time*trt
  
  p1 <- predict(m1, classify="trt:day")
  p1 <- p1$predictions$pvals
  foo2 <- xyplot(predicted.value ~ day|trt, p1, type='l', lwd=2, lty=1, col="black")
  
  require(latticeExtra)
  print(foo1 + foo2)

  # Not much evidence for treatment differences
  
  anova(m1)
  ##               Df Sum of Sq Wald statistic Pr(Chisq)    
  ## (Intercept)    1  37128459         139060    <2e-16 ***
  ## trt            1       455              2    0.1917    
  ## lin(day)       1    570798           2138    <2e-16 ***
  ## trt:lin(day)   1       283              1    0.3031    
  ## residual (MS)          267                             
  
  require(lucid)
  vc(m1)
  ##               effect component std.error z.ratio constr
  ##             spl(day)  25.29    24.09        1       pos
  ##             dev(day)   1.902    4.923       0.39    pos
  ## trt:spl(day)!trt.var   0.00003  0.000002   18      bnd 
  ## trt:dev(day)!trt.var   0.00003  0.000002   18      bnd 
  ##           R!variance 267       14.84       18       pos

}

}
\keyword{datasets}
