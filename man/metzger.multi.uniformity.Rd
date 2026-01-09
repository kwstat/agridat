\name{metzger.multi.uniformity}
\alias{metzger.multi.uniformity}
\docType{data}
\title{
  Uniformity trials with multiple crops, 9 years on the same land
}
\description{
  Uniformity trials with multiple crops, 9 years on the same land at
  Kansas Agricultural Experiment Station
}
\usage{data("metzger.multi.uniformity")}
\format{
  A data frame with 468 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{crop}}{year and crop, see Details}
    \item{\code{yield}}{yield, see Details}
  }
}
\details{

  Individual plots are 1/20 acre. This is almost certainly 66 feet long
  (1 chain) by 33 feet wide. 33 * 66 * 20 = 43560 sq feet = 1 acre.
  Long, narrow plots are common in field trials.

  Field width: 3 series * 33 feet

  Field length: 12 plots * 66 feet.
  
  1925. Corn. Bu/ac.
  
  1926 Oats. Grain bu/ac, Straw tons/ac. Straw data look poorly
  measured.
  
  1927 Wheat. Grain bu/ac, Straw tons/ac.
  
  1928 Wheat. Grain bu/ac, Straw tons/ac.
  
  1929 Alfalfa. Pounds/ac.
  
  1930 Alfalfa. Pounds/ac.
  
  1931 Alfalfa. Pounds/ac.
  
  1932 Grain bu/ac, Stover tons/ac.
  
  1934 Stover tons/ac.
  
  Director's report 1920-1922. Cover has a fuzzy photo of the soil
  fertility experiment.

  Director's report 1934-1936. Project 17: The great majority of the
  plots were quite erratic in their yield performance. A heavy yield one
  year was in many cases followed by a light yield the following
  year. The variability among the plots was highest in years of low
  rainfall. Hence it appears that under the conditions represented by
  these tests a uniform cropping trial is of decidedly limited value as
  a means of indicating relatively permanent differences in the
  productivity of a group of experimental plots. Source: Eighth Biennial
  Report of the Director 1934-1936, Agricultural Experiment Station,
  p. 29. https://www.ksre.k-state.edu/historicpublications/pubs/BR08.pdf

  SB228 1922 "Relationship of Crop Yields to Quantity of Irrigation Water
  in Southwestern Kansas". Describes experiments having side-by-side
  series of duplicate plots, 33 feet by 66 feet = 2178 square feet = 1/20 acre.

  In the source documents from Rothamsted, column 1 is series E, col 2 =
  series F, col 3 = series G.
  
  Data acquisition: PDFs from Rothamsted archive were OCRd. Text copied
  and formatted by K.Wright. 

  This data was made available with special help from the staff at
  Rothamsted Research Library.

}
\source{
  Rothamsted Research Library, Box STATS17  WG Cochran, Folder 5.
}
\references{
  Metzger, W. H. (1935).
  The relation of varying rainfall to soil heterogeneity as measured by crop production.
  Journal of the American Society of Agronomy, 27, 274-278.
  https://doi.org/10.2134/agronj1935.00021962002700040006x
  https://archive.org/details/dli.ernet.232701/page/273/
}
\examples{
\dontrun{
  library(agridat)
  data(metzger.multi.uniformity)
  dat <- metzger.multi.uniformity

library(lattice)
# qq plot for each crop
qqmath( ~ yield | crop, data=dat,
        main="metzger.multi.uniformity - QQ plot",
        xlab="Theoretical Quantiles", ylab="Sample Quantiles",
        scales=list(x=list(relation="free"), y=list(relation="free")) )

# Convert yield values to percent of mean within each crop
library(dplyr)
dat2 <- group_by(dat, crop)
dat2 <- mutate(dat2, pom = yield / mean(yield) * 100)
dat2 <- ungroup(dat2)

libs(desplot)
desplot(dat2, pom ~ col*row | crop,
        flip=TRUE, aspect=(12*66)/(3*33),
        main="metzger.multi.uniformity - percent of mean within crop")

# reshape to wide format for splom
library(tidyr)
dat_wide <- select(dat2, row, col, crop, yield)
dat_wide <- pivot_wider(dat_wide, names_from = crop, values_from = yield)
splom(dat_wide[ , 3:15], main="metzger.multi.uniformity - scatterplot matrix")

}
}
\keyword{datasets}
