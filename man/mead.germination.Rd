\name{mead.germination}
\alias{mead.germination}
\docType{data}
\title{
  Seed germination with different temperatures/concentrations
}
\description{
  Seed germination with different temperatures/concentrations
}
\usage{data(mead.germination)}
\format{
  A data frame with 64 observations on the following 5 variables.
  \describe{
    \item{\code{temp}}{Temperature regime}
    \item{\code{rep}}{Replication factor (not blocking)}
    \item{\code{conc}}{Chemical concentration}
    \item{\code{germ}}{Number of seeds germinating}
    \item{\code{seeds}}{Number of seeds tested = 50}
  }
}
\details{
  The rep factor is NOT a blocking factor.
}
\source{
  Roger Mead, Robert N Curnow, Anne M Hasted. 2002.
  Statistical Methods in Agriculture and Experimental Biology, 3rd ed.
  Chapman and Hall.  Page 350-351.

  Used with permission of Roger Mead, Robert Curnow, and Anne Hasted.
}
\references{
  Schabenberger, O. and Pierce, F.J., 2002.
  \emph{Contemporary statistical models for the plant and soil sciences},
  CRC.
}
\examples{
data(mead.germination)

dat <- mead.germination
dat <- transform(dat, concf=factor(conc))
xyplot(germ~log(conc+.01)|temp, dat, layout=c(4,1))

m1 <- glm(cbind(germ, seeds-germ) ~ 1, dat, family=binomial)
m2 <- glm(cbind(germ, seeds-germ) ~ temp, dat, family=binomial)
m3 <- glm(cbind(germ, seeds-germ) ~ concf, dat, family=binomial)
m4 <- glm(cbind(germ, seeds-germ) ~ temp + concf, dat, family=binomial)
m5 <- glm(cbind(germ, seeds-germ) ~ temp * concf, dat, family=binomial)
anova(m1,m2,m3,m4,m5)

# Show logit and fitted values.  T2 has highest germination
subset(cbind(dat, predict(m5), fitted(m5)), rep=="R1")

}
\keyword{datasets}
