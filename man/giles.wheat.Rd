\name{giles.wheat}
\alias{giles.wheat}
\docType{data}
\title{
  Straw length and ear emergence for wheat genotypes.
}
\description{
  Straw length and ear emergence for wheat genotypes.  Data are
  unbalanced with respect to experiment year and genotype.
}
\usage{data("giles.wheat")}
\format{
  A data frame with 247 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{Genotype. Note, this is numeric!}
    \item{\code{env}}{Environment factor}
    \item{\code{straw}}{Straw length}
    \item{\code{emergence}}{Ear emergence Julian date}
  }
}
\details{
  
  Highly unbalanced data of straw length and ear emergence date for
  wheat genotypes.

  The 'genotype' column is called 'Accession number' in original data.
  The genotypes were chosen to represent the range of variation in the
  trait.

  The Julian date was found to be preferable to other methods (such as
  days from sowing).

  Piepho (2003) fit a bilinear model to the straw emergence data.  This
  is similar to Finlay-Wilkinson regression.
  
}

\source{

  R. Giles (1990).
  Utilization of unreplicated observations of agvan
  ronomic characters in a wheat germplasm collection.
  In: \emph{Wheat Genetic Resources. Meeting Diverse Needs}.
  Wiley, Chichester, U.K., pp.113-130.
  
}
\references{
  
  Piepho, HP (2003).
  Model-based mean adjustment in quantitative germplasm evaluation data.
  \emph{Genetic Resources and Crop Evolution}, 50, 281-290.
  \url{http://doi.org/10.1023/A:1023503900759}
  
}
\examples{
data(giles.wheat)
## maybe str(giles.wheat) ; plot(giles.wheat) ...
}
\keyword{datasets}
