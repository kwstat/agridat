# The data below are from
# Adoption of Genetically Engineered Crops in the United States - Recent Trends in GE Adoption
# USDA Economic Research Service. Accessed 2025-09-30.
# https://www.ers.usda.gov/data-products/adoption-of-genetically-engineered-crops-in-the-united-states/recent-trends-in-ge-adoption

setwd("c:/drop/rpack/agridat/data-raw")
dat <- read.csv("usda.gmo.adoption.csv")
head(dat)
usda.gmoadoption <- dat
libs(kw)
agex(usda.gmoadoption)
# ----------------------------------------------------------------------------

# Plot the raw data
library(ggplot2)
ggplot(dat, aes(x = year, y = percent, color = crop)) +
  geom_point() +
  geom_line() +
  labs(
    title = "Adoption of Genetically Engineered Crops in the U.S.",
    y = "Percentage of acres for each crop"
  ) +
  theme_minimal()
