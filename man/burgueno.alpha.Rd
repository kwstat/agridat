\name{burgueno.alpha}
\alias{burgueno.alpha}
\docType{data}
\title{
  Incomplete block alpha design
}
\description{
  Incomplete block alpha design
}
\usage{data("burgueno.alpha")}

\format{
  A data frame with 48 observations on the following 6 variables.
  \describe{
    \item{\code{rep}}{rep factor, 3 levels}
    \item{\code{block}}{block factor, 12 levels}
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{gen}}{genotype factor, 16 levels}
    \item{\code{yield}}{yield, numeric}
  }
}
\details{
  A field experiment with 3 reps, 4 blocks per rep, laid out as an alpha
  design.

  The plot size is not given.
}

\source{
  J Burgueno, A Cadena, J Crossa, M Banziger, A Gilmour, B Cullis. 2000.
  \emph{User's guide for spatial analysis of field variety trials using
    ASREML}.  CIMMYT.
  https://books.google.com/books?id=PR_tYCFyLCYC&pg=PA1
  
  Electronic version of the data obtained from CropStat software.

  Used with permission of Juan Burgueno.
}

\examples{

data(burgueno.alpha)
dat <- burgueno.alpha

if(require(desplot)){
  desplot(yield~col*row, dat,
          out1=rep, out2=block, # aspect unknown
          text=gen, cex=1,shorten="none",
          main='burgueno.alpha')
}


if(require(lme4) && require(lucid)){
  # Inc block model
  m0 <- lmer(yield ~ gen + (1|rep/block), data=dat)
  vc(m0) # Matches Burgueno p. 26
  ##        grp        var1 var2   vcov sdcor
  ##  block:rep (Intercept) <NA>  86900 294.8
  ##        rep (Intercept) <NA> 200900 448.2
  ##   Residual        <NA> <NA> 133200 365
  
}

dat <- transform(dat, xf=factor(col), yf=factor(row))
dat <- dat[order(dat$xf, dat$yf),]                 

# ----------------------------------------------------------------------------

\dontrun{
  ## require(asreml)

  ## # Sequence of models on page 36
  
  ## m1 <- asreml(yield ~  gen, data=dat)
  ## m1$loglik # -232.13
  
  ## m2 <- asreml(yield ~  gen, data=dat,
  ##              random = ~ rep)
  ## m2$loglik # -223.48

  ## # Inc Block model
  ## m3 <- asreml(yield ~  gen, data=dat,
  ##              random = ~ rep/block)
  ## m3$loglik # -221.42
  ## m3$coef$fixed # Matches solution on p. 27

  ## # AR1xAR1 model
  ## m4 <- asreml(yield ~ 1 + gen, data=dat,
  ##              rcov = ~ar1(xf):ar1(yf))
  ## m4$loglik # -221.47
  ## plot(variogram(m4), main="burgueno.alpha") # Figure 1
  
  ## m5 <- asreml(yield ~ 1 + gen, data=dat,
  ##              random= ~ yf, rcov = ~ar1(xf):ar1(yf))
  ## m5$loglik # -220.07

  ## m6 <- asreml(yield ~ 1 + gen + pol(yf,-2), data=dat,
  ##              rcov = ~ar1(xf):ar1(yf))
  ## m6$loglik # -204.64 vs. 203.69
  
  ## m7 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
  ##              random= ~ spl(yf), rcov = ~ar1(xf):ar1(yf))
  ## m7$loglik # -212.51
  
  ## m8 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
  ##              random= ~ spl(yf))
  ## m8$loglik # -213.91

  ## # Polynomial model with predictions
  ## m9 <- asreml(yield ~ 1 + gen + pol(yf,-2) + pol(xf,-2), data=dat,
  ##              random= ~ spl(yf),  rcov = ~ar1(xf):ar1(yf))
  ## m9$loglik # -191.44 vs -189.61
  ## p9 <- predict(m9, classify="gen:xf:yf", levels=list(xf=1,yf=1)) 
  ## p9$predictions
  
  ## m10 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
  ##               rcov = ~ar1(xf):ar1(yf))
  ## m10$loglik # -211.56
  
  ## m11 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
  ##               random= ~ spl(yf), rcov = ~ar1(xf):ar1(yf))
  ## m11$loglik # -208.90
  
  ## m12 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
  ##               random= ~ spl(yf)+spl(xf), rcov = ~ar1(xf):ar1(yf))
  ## m12$loglik # -206.82
  
  ## m13 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
  ##               random= ~ spl(yf)+spl(xf))
  ## m13$loglik # -207.52

}

# ----------------------------------------------------------------------------

\dontrun{
  require(asreml4)

  # Sequence of models on page 36
  
  m1 <- asreml(yield ~  gen, data=dat)
  m1$loglik # -232.13
  
  m2 <- asreml(yield ~  gen, data=dat,
               random = ~ rep)
  m2$loglik # -223.48

  # Inc Block model
  m3 <- asreml(yield ~  gen, data=dat,
               random = ~ rep/block)
  m3$loglik # -221.42
  m3$coef$fixed # Matches solution on p. 27

  # AR1xAR1 model
  m4 <- asreml(yield ~ 1 + gen, data=dat,
               resid = ~ar1(xf):ar1(yf))
  m4$loglik # -221.47
  plot(varioGram(m4), main="burgueno.alpha") # Figure 1
  
  m5 <- asreml(yield ~ 1 + gen, data=dat,
               random= ~ yf, resid = ~ar1(xf):ar1(yf))
  m5$loglik # -220.07

  m6 <- asreml(yield ~ 1 + gen + pol(yf,-2), data=dat,
               resid = ~ar1(xf):ar1(yf))
  m6$loglik # -204.64 vs. 203.69
  
  m7 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
               random= ~ spl(yf), resid = ~ar1(xf):ar1(yf))
  m7$loglik # -212.51
  
  m8 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
               random= ~ spl(yf))
  m8$loglik # -213.91

  # Polynomial model with predictions
  m9 <- asreml(yield ~ 1 + gen + pol(yf,-2) + pol(xf,-2), data=dat,
               random= ~ spl(yf),
               resid = ~ar1(xf):ar1(yf))
  m9 <- update(m9)
  m9$loglik # -191.44 vs -189.61
  p9 <- predict(m9, classify="gen:xf:yf", levels=list(xf=1,yf=1)) 
  p9
  
  m10 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
                resid = ~ar1(xf):ar1(yf))
  m10$loglik # -211.56
  
  m11 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
                random= ~ spl(yf),
                resid = ~ar1(xf):ar1(yf))
  m11$loglik # -208.90
  
  m12 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
                random= ~ spl(yf)+spl(xf),
                resid = ~ar1(xf):ar1(yf))
  m12$loglik # -206.82
  
  m13 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
                random= ~ spl(yf)+spl(xf))
  m13$loglik # -207.52

}

}

\keyword{datasets}
