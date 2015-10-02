\name{papcov}
\alias{papcov}
\title{Construct Papadakis covariates for nearest neighbor analysis}
\usage{
papcov(resid, x, y)
}
\arguments{
  
  \item{resid}{A vector of residuals.}
  
  \item{x}{The ordinate in the residuals in a left/right direction.}
  
  \item{y}{The ordinate of the residuals in an up/down direction.}
}

\value{
A list of length 2:
  \item{LR }{A vector of covariates that are the average of neighboring
    residuals in the left/right direction.}
  \item{UD }{A vector of covariates that are the average of neighboring
    residuals in the up/down direction.}
}

\description{
  From a vector of residuals and coordinate vectors x and y, compute the
  average of the neighboring residuals in a left/right direction.  Also
  in an up/down direction.  These are covariates for use in a
  nearest-neighbor analysis.
}

\details{

  Papadakis (1937) believed that traditional blocks did not adequately
  represent the patchiness of soil fertility patterns and instead
  proposed adjusting the yield of each plot by the performance of the
  neighboring plots.
  
  If there is heterogeneity in the field that is of a scale smaller than
  the block (but larger than the individual plots) then adjacent plots
  will be positively correlated and this information about the
  neighboring plots can be used to reduce the effect of spatial
  heterogeneity and increase the accuracy of the treatment effects.
  
  The Papadakis method is a nearest neighbor method that uses a residual
  covariate in the analysis. In essence, the method follows the
  following steps:
  
  1. Fit a treatment model and calculate the residuals from the model.

  2. Calculate covariates that are the average of the neighboring
  residuals.

  3. Fit a model with additional covariate terms for the residuals.

  The LR covariate for the (i,j)th plot is the
  average of the residuals for the plots immediately to the left and
  right of the (i,j)th plot.  If one of these neighbors is missing, then
  the covariate is constructed from the single remaining neighboring
  residual.  Border plots use only one neighboring residual.  The UD
  covariate for is similarly constructed from residuals for plots
  immediately up or down from the (i,j)th plot.
}

\references{

  Paul Hinz (1987). Nearest-Neighbor Analysis in Practice.
  \emph{Iowa State Journal of Research}, 62, 199--217.

  J S Papadakis (1937).
  Methode statistique pour les experiences en champ.
  \emph{Bulletin Institute de L'Ameloration des Plantesa Salonique},
  23. 

  Stroup, Walter W., P Stephen Baenziger, Dieter K Mulitze (1994).
  Removing Spatial Variation from Wheat Yield Trials: A Comparison of
  Methods. \emph{Crop Science}, 86:62--66.
  
}

\author{
  Kevin Wright
}

\examples{

# Reproduce Hinz 1987 case 2.
data(federer.tobacco)
dat <- federer.tobacco
dat <- transform(dat, height=height-600)

# Model 1 - RCB
m1 <- aov(height ~ factor(block) + factor(dose), dat)
anova(m1)

# Model 2 - Row/Col as class variables
m2 <- aov(height ~ factor(block) + factor(dose) + factor(row), dat)
anova(m2)

# Model 3 - Two-step Papadakis
m3 <- aov(height ~ factor(dose), dat)
dat <- cbind(dat, papcov(m3$resid, dat$block, dat$row))
m4 <- aov(height ~ factor(dose) + LR + UD, data=dat)
anova(m4)
# Resid MS uses 1 df less to account for covariates.  Matches Hinz.
582073 / 46 


# Now an iterated procedure as given in Stroup et al, Table 2
data(stroup.nin)
dat2 <- stroup.nin
dat2 <- subset(dat2,!is.na(yield))
n.gen <- nlevels(dat2$gen)

# RCB model, ranks match Stroup Table 2, RCB Alliance
m5 <-  lm(yield ~ gen -1 + rep, data=dat2)
pred.rcb <- coef(m5)[1:n.gen] # RCB adj means
rev(57-sort(rank(pred.rcb)))

# Initial genotype model (no blocks)
m6 <-  lm(yield ~ gen -1, data=dat2)
# Calculate Papadakis covariates
pp <- papcov(resid(m6), dat2$x, dat2$y)
dat2$LR <- pp$LR
dat2$UD <- pp$UD
# Single iteration of Papadakis model
m7 <- lm(yield ~ gen - 1 + LR + UD, data=dat2)
# Papadakis adjusted means
adjmn <- coef(m7)[1:n.gen]
# Residual = observed - adjusted mean
resid <- dat2$yield - adjmn[match(paste0("gen",dat2$gen),names(adjmn))]

# Now iterate Papadakis method to convergence
iter <- 0
notConv <- TRUE
while(notConv){
  iter <- iter + 1
  # Covariates based on residuals
  pp <- papcov(resid, dat2$x, dat2$y)
  dat2$LR <- pp$LR
  dat2$UD <- pp$UD
  m8 <- lm(yield ~ gen - 1 + LR + UD, data=dat2)
  # Check convergence of adjusted means
  prevmn <- adjmn
  adjmn <- coef(m8)[1:n.gen]
  tol <- sum((adjmn - prevmn)^2)
  cat("Iteration: ",iter," tol: ",tol,"\n")
  notConv <- tol > .001
  resid <- dat2$yield - adjmn[match(paste0("gen",dat2$gen),names(adjmn))]
}
pred.pap <- adjmn

# Ranks almost match Stroup et al, Table 2, Alliance, RCB+NNA-PAP
all <- data.frame(rcb=57-rank(pred.rcb), nna=57-rank(pred.pap))
all[order(all$rcb),]

# Visually compare the coefficients from the two methods
lims=range(c(pred.rcb,pred.pap))
plot(pred.rcb,pred.pap,xlim=lims, ylim=lims,xlab="RCB",ylab="Papadakis",type='n')
text(pred.rcb,pred.pap, substring(names(pred.rcb),4),cex=0.5)
title("Iterated Papadakis vs. RCB")
abline(0,1)

}

\keyword{ models }
