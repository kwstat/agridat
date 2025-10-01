\name{usda.gmoadoption}
\alias{usda.gmoadoption}
\docType{data}
\title{
  Adoption of genetically modified crops in the United States
}
\description{
  Adoption of genetically modified crops in the U.S. from 1996 to 2022.
}
\usage{data("usda.gmoadoption")}
\format{
  A data frame with 145 observations on the following 3 variables.
  \describe{
    \item{\code{year}}{Year of crop}
    \item{\code{crop}}{Crop type}
    \item{\code{percent}}{Percent of planted acres}
  }
}
\details{
  HT indicates herbicide-tolerant crops.
  Bt indicates insect-resistant (Bacillus thuringiensis) crops.
  The "percent" column is the percentage of planted acres for each
  crop that were genetically modified.
  HT/Bt for corn and cotton are not mutually exclusive categories. For example,
  as time progressed corn hybrids tended to be both HT and Bt.

}
\source{
  Adoption of Genetically Engineered Crops in the United States - Recent Trends in GE Adoption
  USDA Economic Research Service. Accessed 2025-09-30.
  https://www.ers.usda.gov/data-products/adoption-of-genetically-engineered-crops-in-the-united-states/recent-trends-in-ge-adoption
}
\references{
  None
}
\examples{
\dontrun{
data(usda.gmoadoption)
dat <- usda.gmoadoption
library(ggplot2)
ggplot(dat, aes(x = year, y = percent, color = crop)) +
  geom_point() +
  geom_line() +
  labs(
    title = "Adoption of Genetically Engineered Crops in the U.S.",
    y = "Percentage of acres for each crop"
  ) +
  theme_minimal()
}
}
\keyword{datasets}
