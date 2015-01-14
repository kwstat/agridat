\name{fisher.latin}
\alias{fisher.latin}
\docType{data}
\title{
  Latin square experiment on mangolds
}
\description{
  Latin square experiment on mangolds.  Used by R. A. Fisher.
}
\usage{data(fisher.latin)}
\format{
  A data frame with 25 observations on the following 4 variables.
  \describe{
    \item{\code{trt}}{treatment factor, 5 levels}
    \item{\code{yield}}{yield}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
  }
}
\details{
  Yields are root weights.  Data originally collected by Mercer and
  Hall as part of a uniformity trial.

  This data is the same as the data from columns 1-5, rows 16-20, of the
  mercer.mangold.uniformity data in this package.

  Unsurprisingly, there are no significant treatment differences.

}
\source{
  Mercer, WB and Hall, AD, 1911. The experimental error of field trials
  \emph{The Journal of Agricultural Science}, 4, 107-132. Table 1.

  R. A. Fisher. \emph{Statistical Methods for Research Workers}.
}

\examples{

data(fisher.latin)
dat <- fisher.latin

# Standard latin-square analysis
m1 <- lm(yield ~ trt + factor(row) + factor(col), data=dat)
anova(m1)

}
\keyword{datasets}
