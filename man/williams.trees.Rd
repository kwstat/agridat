\name{williams.trees}
\alias{williams.trees}
\docType{data}
\title{
  Multi-environment trial of trees, height / survival of 37 species at 6 sites in Thailand
}
\description{
  Multi-environment trial of trees, height / survival of 37 species at 6 sites in Thailand
}

\format{
  A data frame with 222 observations on the following 4 variables.
  \describe{
    \item{\code{env}}{Environment factor, 6 levels}
    \item{\code{gen}}{Genetic factor, 37 levels}
    \item{\code{height}}{Height (cm)}
    \item{\code{survival}}{Survival percentage}
  }
}
\details{
  Planted in 1985 at six sites in Thailand.  RCB with 3 reps.  The data
  here is the mean of the three reps.  Plots were 5 meters square with
  spacing 2m x 2m.  Measurements collected at 24 months.  The \code{gen}
  column in the data is actually \emph{seedlot}, as some tree species
  have multiple seed lots.  The trees are mostly acacia and eucalyptus.

  Used with permission of Emlyn Williams.
}

\source{
  Williams, ER and Luangviriyasaeng, V. 1989.
  Statistical analysis of tree species trial and seedlot:site
  interaction in Thailand.  Chapter 14 of \emph{Trees for the
    Tropics: Growing Australian Multipurpose Trees and Shrubs in
    Developing Countries}. Pages 145--152.
  http://aciar.gov.au/publication/MN010
}

\references{
  E. R. Williams and A. C. Matheson and C. E Harwood,
  Experimental Design and Analysis for Tree Improvement.
  CSIRO Publishing, 2002.
}

\examples{

library(agridat)

data(williams.trees)
dat <- williams.trees

libs(lattice)
xyplot(survival~height|env,dat, main="williams.trees", xlab="Height",
ylab="Percent surviving")
}

