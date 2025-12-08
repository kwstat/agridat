\name{petersen.wheat}
\alias{petersen.wheat}
\docType{data}
\title{
  Augmented design of durum wheat
}
\description{
  Augmented design of durum wheat with 30 new selections and 3 check varieties.
}
\usage{data("petersen.wheat")}
\format{
  A data frame with 48 observations on the following 4 variables.
  \describe{
    \item{\code{plot}}{Plot number, 1-48}
    \item{\code{block}}{Block factor, 6 levels}
    \item{\code{gen}}{Genotype factor, 33 levels}
    \item{\code{yield}}{Yield, kg/ha}
  }
}
\details{
  A cereal breeder conducted a preliminary yield trial on 30 new
  selections of durum wheat. The new selections were compared against
  three check (standard) varieties: St (Stork), Ci (Cimmaron), and
  Wa (Waha).

  Only enough seed of the new varieties was available to plant a single
  row of each, so an augmented design was used with 6 blocks.
  Each block contains 8 plots: 3 check varieties (replicated in every block)
  plus 5 unreplicated new selections.

  The field layout consisted of a single line of 48 plots.

  Petersen reports MSE = 91,103 from the ANOVA of check varieties.

  Data collected for agridat by Paul Schmidt.
}
\source{
  Roger G Petersen (1994).
  Agricultural Field Experiments: Design and Analysis.
  Marcel Dekker, New York.
  https://archive.org/details/agriculturalfiel0000pete
  Table 5.7, page 170.
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
data(petersen.wheat)
dat <- petersen.wheat

libs(desplot)

# True layout: single line of 48 plots
# For visualization, rearrange into a grid (8 rows x 6 columns)
dat <- transform(dat,
  row = (plot - 1) \%\% 8 + 1,
  col = (plot - 1) \%/\% 8 + 1
)

# Custom colors: green shades for 30 new selections, orange shades for 3 checks
checks <- c("Ci", "St", "Wa")
new_gens <- sort(setdiff(levels(dat$gen), checks))
col_checks <- colorRampPalette(c("darkorange", "orange", "goldenrod"))(3)
col_new <- colorRampPalette(c("darkgreen", "forestgreen", "limegreen"))(30)
names(col_checks) <- checks
names(col_new) <- new_gens
gen_cols <- c(col_checks, col_new)

desplot(dat, gen ~ col*row,
  col.regions = gen_cols,
  out1 = block,
  text = gen, shorten = "no", cex = 0.7,
  show.key = FALSE,
  flip = TRUE,
  main = "petersen.wheat - rearranged as grid"
)

}
}
\keyword{datasets}
