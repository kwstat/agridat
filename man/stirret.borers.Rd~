\name{stirret.borers}
\alias{stirret.borers}
\docType{data}
\title{
  Corn borer control by application of fungal spores.
}

\description{
  Corn borer control by application of fungal spores.
}

\format{
  A data frame with 60 observations on the following 4 variables.
  \describe{
    \item{\code{block}}{block factor, 15 levels}
    \item{\code{trt}}{treatment factor, 4 levels}
    \item{\code{count1}}{count of borers on August 18}
    \item{\code{count2}}{count of borers on October 19}
  }
}
\details{
  Experiment conducted in 1935, Ottawa.  European corn borer infestation
  was established by application of egg masses to plants.
  Treatments were applied on July 8 and July 19 at two levels, 0 and 40
  grams per acre.  The number of borers per plot were counted on
  Aug 18 and Oct 19.
}

\source{
  Stirrett, George M and Beall, Geoffrey and Timonin, M. (1937).
  A field experiment on the control of the European corn borer, Pyrausta
  nubilalis Hubn, by Beauveria bassiana Vuill.
  \emph{Sci. Agric.}, 17, 587--591.  Table 2.
}

\examples{

dat <- stirret.borers

# Even though the data are counts, Normal distribution seems okay
qqmath(~count1|trt, dat, main="stirret.borers")

m1 <- lm(count1 ~ trt + block, dat)
anova(m1)

\dontrun{
require(effects)
e1 <- effect('trt',m1)
as.data.frame(e1)
plot(e1, main="stirret.borer")
}

}
\keyword{datasets}
