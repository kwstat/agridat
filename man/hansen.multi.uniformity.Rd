\name{hansen.multi.uniformity}
\alias{hansen.multi.uniformity}
\docType{data}
\title{
  Multi-year uniformity trial in Denmark
}
\description{
  Multi-year uniformity trial in Denmark
}
\usage{data("hansen.multi.uniformity")}
\format{
  A data frame with 662 observations on the following 6 variables.
  \describe{
    \item{\code{field}}{field name}
    \item{\code{year}}{year}
    \item{\code{crop}}{crop}
    \item{\code{yield}}{yield (percent of mean)}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
  }
}
\details{

  Uniformity trials were carried out between 1906 and 1911 on two fields
  at Aarslev, Denmark. The yield values are expressed as percent of mean
  yield for the year.

  The scale on the map in Hansen shows "Alen" as the scale. See
  https://en.wikipedia.org/wiki/Alen_(unit_of_length) The Danish alen =
  62.77 cm.

  Field A2:

  Based on the map, the field is approximately 60 alen x 70 alen (38 m x
  44 m), but the orientation of the field is not clear.  Plots are
  probably circa 7.4 m on a side.

  Divided into 30 plots -- 6 strips of 5.  The crops grown were: 1907
  oats, 1908 rye, 1909 barley, 1910 mangolds, 1911 barley. 

  Sanders said: There appeared to be two printer errors in the paper.
  In field A2 the yields given for 1908 add up to 3010 instead of 3000:
  reference to the Fig.  6 given there seemed to indicate that the
  excess lay in row 3 and eventually it was decided to reduce plots 3c
  to 96 and 3f to 84.

  Field E2:
  
  Field is approximately 120 alen x 200 alen (76m x 125m).  Plots are
  probably circa 8-9m on a side. 

  Divided into 128 plots: 16 strips of 8.  Crops grown: 1906 oats, 1907
  barley, 1908 seeds, 1909 rye.
  
  Sanders said, There was a remarkable oscillation in fertility across
  field E2 in one direction, the 1st, 3rd, ...  15th strips (columns)
  consistently giving much higher yields than the 2nd, 4th, ... 16th
  strips (columns). In fact in the four years the odd numbered strips
  gave a total yield of 27,817, as compared to 23,383 for the even
  numbered strips.  This oscillation apparently arose as a legacy of the
  old practice of ploughing in high ridges: the tops of the ridges
  exhibited greater fertility than the borders of the furrows, so that
  soil was worked from the former to the latter and the field leveled
  out. This meant that over the site of the old furrows there was a good
  depth of rich soil, whilst it was very shallow where the ridges had
  been. The strips were so arranged as to cover the site of the furrow
  and of the ridge alternately, with the result noted above.  Sanders:
  In order to escape this variation, the table was condensed by taking 2
  strips together (so that the new strips each included the whole of one
  of the old "lands") making it an 8 by 8 square.

  Sanders said: In field E2 in 1908, column 10 sums to 791 instead
  of 786 as shown: reference to Fig. 13 indicated that the yield
  of plot 10g should probably have been 92 instead of 97. 

  The version of the data in the package uses the changes suggested by Sanders.

}
\source{
  Hansen, Niels Anton (1914).
  Prøvedyrkning paa Forsøgsstationen ved Aarslev.
  Page 557 has field A2. Page 562 has field E2.
}
\references{
  Eden, T. and E. J. Maskell. (1928).
  The influence of soil heterogeneity on the growth and yield of
  successive crops.
  Jour of Agricultural Science, 18, 163-185.
  https://archive.org/stream/in.ernet.dli.2015.25895/2015.25895.Journal-Of-Agricultural-Science-Vol-xviii-1928#page/n175
  
  Sanders, H. G. 1930.
  A note on the value of uniformity trials for subsequent experiments.
  The Journal of Agricultural Science. 20, 63-73.
  https://dx.doi.org/10.1017/S0021859600088626
  https://repository.rothamsted.ac.uk/item/97039/a-note-on-the-value-of-uniformity-trials-for-subsequent-experiments
}
\examples{
\dontrun{

  library(agridat)
  data(hansen.multi.uniformity)
  dat <- hansen.multi.uniformity
  
  # Field A2: Average across years
  libs(dplyr)
  dat %>% group_by(row,col) %>% summarize(mn=mean(yield)) %>% dcast(row ~ col, value.var="mn")

  # Field E2: Match column totals
  dat %>% filter(field=="E2") %>% group_by(year,col) %>% summarize(tot=sum(yield)) %>% dcast(year~col, value.var="tot")

  # Heatmaps. Aspect ratio is an educated guess
  libs(dplyr, desplot)
  dat <- dat %>% mutate(dat, field=factor(field), year=factor(year))
  dat %>% filter(field=="A2") %>% desplot(yield ~ col*row|year, tick=TRUE, flip=TRUE, aspect=(5*7.4)/(6*7.4))
  dat %>% filter(field=="E2") %>% desplot(yield ~ col*row|year, tick=TRUE, flip=TRUE, aspect=(8*8)/(16*8))

  # Look at correlation of plots across years
  libs(dplyr, lattice)
  dat <- dat %>% mutate(plot=paste(row,col))
  filter(dat, field=="A2") %>% acast(plot ~ year, value.var="yield") %>%
    splom()
  filter(dat, field=="E2") %>% acast(plot ~ year, value.var="yield") %>%
    splom()

}
}
\keyword{datasets}
