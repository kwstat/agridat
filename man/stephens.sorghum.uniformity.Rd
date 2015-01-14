\name{stephens.sorghum.uniformity}
\alias{stephens.sorghum.uniformity}
\docType{data}
\title{
  Uniformity trial of sorghum silage
}
\description{
  Uniformity trial of sorghum silage, 100x20 plots.
}

\format{
  A data frame with 2000 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column / rod ordinate}
    \item{\code{yield}}{yield, ounces}
  }
}
\details{
Grown near Chillicothe, TX in 1915.  Rows 40 inches apart.
Each row harvested in 1-rod (16.5 ft) lengths.
East side higher yielding than west side.
Yields are weight (ounces) of green forage each rod-row.
Total area harvested: 100*40/12 = 333.33 feet by 20*16.5=330 feet.
}
\source{
Stephens, Joseph C. 1928.
Experimental methods and the probable error in field experiments with sorghum.
\emph{Journal of Agricultural Research}, 37, 629--646.
\url{http://naldc.nal.usda.gov/catalog/IND43967516}
}

\examples{

data(stephens.sorghum.uniformity)
dat <- stephens.sorghum.uniformity

dat <- subset(dat, row>2 & row<99) # omit outer two rows
# mean(dat$yield) # 180.27
# range(dat$yield) # 75,302 matches Stephens

# densityplot(~dat$yield) # Stephens figure 3

# Aggregate 4 side-by-side rows.
# Similar to Stephens Figure 7.  North at top.  East at right.
d4 <- dat
d4$row2 <- ceiling((d4$row-2)/4)
d4 <- aggregate(yield ~ row2+col, data=d4, FUN=sum)
d4$row2 <- 25-d4$row2 # flip horizontally
desplot(yield ~ row2*col, data=d4, flip=TRUE, main="stephens.sorghum.uniformity",
        at=c(500,680,780,1000), col.regions=c('white','gray','gray30'))
}
\keyword{datasets}
