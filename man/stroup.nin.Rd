\name{stroup.nin}
\alias{stroup.nin}
\docType{data}
\title{Nebraska Intrastate Nursery field experiment}
\description{
  The yield data from an advanced Nebraska Intrastate Nursery (NIN) breeding
  trial conducted at Alliance, Nebraska, in 1988/89.
}
\usage{data(stroup.nin)}
\format{
  \describe{
    \item{gen}{Genotype factor, 56 levels}
    \item{rep}{Replicate factor, 4 levels}
    \item{yield}{The yield in bu/ac}
    \item{x}{Column ordinate}
    \item{y}{Row ordinate}
  }
}

\details{
  Four replicates of 19 released cultivars, 35 experimental wheat lines
  and 2 additional triticale lines were laid out in a 22 
  row by 11 column rectangular array of plots; the varieties were
  allocated to the plots using a randomised complete block (RCB) design.
  The blocks are not rectangular but partially overlap columns.
  All plots with missing data are coded as being gen = "Lancer".
  (For ASREML, missing plots need to be included for spatial analysis and the
  level of 'gen' needs to be one that is already in the data.)
  The complete experiment was grown at four locations (Lincoln, Clay
  Center, North Platte, and Alliance).  Only data for the Alliance
  location is included here.

  These data were first analyzed by Stroup et al (1994) and subsequently
  by Littell et al (1996, page 321), Pinheiro and Bates (2000, page 260),
  and Butler et al (2004).  
  
  This version of the data expresses
  the yield in bushels per acre. The results published in Stroup et al
  (1994) are expressed in kg/ha.  For wheat, 1 bu/ac = 67.25 kg/ha.

  Some of the gen names are different in Stroup et al (1994).
  (Sometimes an experimental genotype is given a new name when it is
  released for commercial use.)  At a
  minimum, the following differences in gen names should be noted
  \tabular{ll}{
    stroup.nin \tab Stroup et al \cr
    NE83498 \tab Rawhide \cr
    KS831374 \tab Karl
  }

  Some published versions of the data use long/lat instead of x/y.
  To obtain the correct value of 'long', multiply 'x' by 1.2.
  To obtain the correct value of 'lat', multiply 'y' by 4.3.

}

\source{
  Stroup, Walter W., P Stephen Baenziger, Dieter K Mulitze (1994)
  Removing Spatial Variation from Wheat Yield Trials: A Comparison of
  Methods. \emph{Crop Science}, 86:62--66.
}
\references{
  Littell, R.C. and Milliken, G.A. and Stroup, W.W. and Wolfinger,
  R.D. 1996. \emph{SAS system for mixed models}, SAS Institute, Cary, NC.

  Jose Pinheiro and Douglas Bates, 2000,
  \emph{Mixed Effects Models in S and S-Plus}, Springer.

  Butler, D., B R Cullis, A R Gilmour, B J Goegel.  (2004)
  \emph{Spatial Analysis Mixed Models for S language environments}
}
\seealso{
  Identical data (except for the missing values) are available
  in the \code{nlme} package as \code{\link[nlme]{Wheat2}}.
}

\examples{
dat <- stroup.nin
dat <- transform(dat, xf=factor(x), yf=factor(y))

# Show experiment layout
# Note: all "Buckskin" plots are near left side
desplot(yield~x*y, dat, out1="rep", num=gen, cex=1, main="stroup.nin")

\dontrun{
require("asreml")

# RCB analysis
dat.rcb <- asreml(yield ~ gen, random = ~ rep, data=dat,
            na.method.X="omit")
pred.rcb <- predict(dat.rcb,classify="gen")$predictions

# Two-dimensional spatial model
dat <- dat[order(dat$xf, dat$yf),]
dat.sp <- asreml(yield~gen, rcov=~ar1(xf):ar1(yf),data=dat)
pred.sp <- predict(dat.sp,classify="gen")$predictions

# Compare the estimates from the two methods
plot(pred.rcb$pvals[,2],pred.sp$pvals[,2], xlim=c(16,37), ylim=c(16,37),
  xlab="RCB",ylab="AR1xAR1",type='n')
text(pred.rcb$pvals[,2],pred.sp$pvals[,2],
     as.character(pred.rcb$pvals[,1]),cex=0.5)
abline(0,1)

}

}

