\name{mead.lambs}
\alias{mead.lambs}
\docType{data}
\title{
  Number of lambs born to 3 breeds on 3 farms
}
\description{
  Number of lambs born to 3 breeds on 3 farms
}
\usage{data("mead.lambs")}
\format{
  A data frame with 36 observations on the following 4 variables.
  \describe{
    \item{\code{farm}}{farm: F1, F2, F3}
    \item{\code{breed}}{breed: B1, B2, B3}
    \item{\code{lambclass}}{lambing class: L0, L1, L2, L3}
    \item{\code{y}}{count of ewes in class}
  }
}
\details{
  The data are counts of ewes in different lambing classes.
  The classes are number of live lambs per birth for 0, 1, 2, 3+ lambs.
  
}
\source{
  Roger Mead, Robert N Curnow, Anne M Hasted. 2002.
  Statistical Methods in Agriculture and Experimental Biology, 3rd ed.
  Chapman and Hall. Page 359.
}

\references{
  None.
}

\examples{

data("mead.lambs")
dat <- mead.lambs
names(dat) <- c('F','B','L','y') # for compactness

# Match totals in Mead example 14.6
if(require(dplyr)){
  dat %>% group_by(F,B) %>% summarize(y=sum(y))
}

# Models
m1 <- glm(y ~ F + B + F:B,
          data=dat,
          family=poisson(link=log))
m2 <- update(m1, y ~ F + B + F:B + L)
m3 <- update(m1, y ~ F + B + F:B + L + B:L)
m4 <- update(m1, y ~ F + B + F:B + L + F:L)
m5 <- update(m1, y ~ F + B + F:B + L + B:L + F:L)

AIC(m1, m2, m3, m4, m5) # Model 4 has best AIC

# Change contrasts for Miroslav
m4 <- update(m4,
             contrasts=list(F=contr.sum,B=contr.sum,L=contr.sum))
summary(m4)

# Match deviance table from Mead
if(require(broom)){
  all <- do.call(rbind, lapply(list(m1, m2, m3, m4, m5), broom::glance))
  rownames(all) <- unlist(lapply(list(m1, m2, m3, m4, m5),
                                 function(x) as.character(formula(x)[3])))
  all[,c('deviance','df.residual')]
  ##                              deviance df.residual
  ## F + B + F:B                 683.67257          27
  ## F + B + L + F:B             131.23828          24
  ## F + B + L + F:B + B:L       116.27069          18
  ## F + B + L + F:B + F:L        18.84460          18
  ## F + B + L + F:B + B:L + F:L  14.57987          12
}

# Using MASS::loglm
if(require(MASS)){
  m4b <- MASS::loglm(y ~ F + B + F:B + L + F:L, data = dat)
  # Table of farm * class interactions. Match Mead p. 360
  round(coef(m4b)$F.L,2)
  fitted(m4b)
  resid(m4b)
  # require(vcd)
  # mosaic(m4b, shade=TRUE,
  # formula = ~ F + B + F:B + L + F:L,
  # residual_type="rstandard", keep_aspect=FALSE)
}

}
\keyword{datasets}
