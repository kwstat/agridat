\name{desousa.potato}
\alias{desousa.potato}
\docType{data}
\title{
  On-farm tricot evaluation of potatoes
}
\description{
  On-farm evaluation of 3 potato genotypes per trial in Rwanda
}
\usage{data("desousa.potato")}
\format{
  A data frame with 168 observations on the following 11 variables.
  \describe{
    \item{\code{id}}{trial ID}
    \item{\code{project_name}}{project}
    \item{\code{gen_A}}{genotype 1 in each trial}
    \item{\code{gen_B}}{genotype 2}
    \item{\code{gen_C}}{genotype 3}
    \item{\code{start}}{start date}
    \item{\code{end}}{end date}
    \item{\code{yield_pos}}{highest-yielding genotype}
    \item{\code{yield_neg}}{lowest-yielding genotype}
    \item{\code{lon}}{longitude}
    \item{\code{lat}}{latitude}
  }
}
\details{
  The data come from "tricot" (triadic comparisons of technology) trials.
  On-farm potato evaluation trials conducted in Rwanda, beginning
  Sep/Oct 2020.
  
  There are 11 genotypes evaluated in 168 field trials in an incomplete
  block design with 3 genotypes at each trial.
  Within each trial the highest-yield and lowest-yield genotypes are
  recorded.
  
  Electronic data retrieved 2025.12.08 from https://zenodo.org/records/6286006.
  File:  data/potato.csv
  Open license. 
  Also at https://github.com/AgrDataSci/tricot-framework-rtb/tree/v0.1

  Data curated by K.Wright
  
}
\source{
  de Sousa, K., van Etten, J., Manners, R. et al. (2024).
  The tricot approach: an agile framework for decentralized on-farm testing supported by citizen science. A retrospective.
  Agronomy for Sustainable Development, 44, 8.
  https://doi.org/10.1007/s13593-023-00937-1
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(desousa.potato)
  dat <- agridat::desousa.potato

  # Convert each trial result to vector of ranks
  libs(gosset)
  datrnk <- gosset::rank_tricot(dat,
                                # Specify the columns containing the three genotypes
                                items=c("gen_A", "gen_B","gen_C"),
                                # Specify the columns containing the rankings
                                input=c("yield_pos", "yield_neg"),
                                group = TRUE)
  head(datrnk)

  # Basic PlacketLuce model using only the ranks
  libs(PlackettLuce)
  mod0 <- PlackettLuce(datrnk)
  
  # worth parameters (sum to 1) - probability of each item being ranked first
  coef(mod0, log = FALSE)
  plot(mod0, log=FALSE)

  # Compare pairs of entries, quasi standard errors
  # vertical line is at 1/11 (number of varieties)
  mod0qv <- qvcalc::qvcalc(mod0)
  # This is log scale.
  plot(mod0qv, ylab = "Worth (log)", main = "desousa.potato", las=2)

  # Could add weather covariates as in
  # https://www.sciencedirect.com/science/article/pii/S2352711023000985?via%3Dihub
}
}
\keyword{datasets}
