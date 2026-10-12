
library(readxl)
dat0 <- readxl::read_xlsx("data-raw/prillwitz.tea.uniformity.xlsx")
head(dat0)
image(t(as.matrix(dat0[, -1])))
# reshape this to tall via tidyr
library(tidyr)
dat <- pivot_longer(dat0, cols = starts_with("Cut_"), names_to = "cut", values_to = "value")
head(dat)

# subset to Cut_01_04, then reshape yield into 6-4 matrix and plot
dat_cut <- subset(dat, cut == "Cut_01_04")
mat <- matrix(dat_cut$value, nrow = 6, ncol = 4)
lattice::levelplot(mat)
mat <- matrix(dat_cut$value, nrow = 4, ncol = 6)
lattice::levelplot(mat)


