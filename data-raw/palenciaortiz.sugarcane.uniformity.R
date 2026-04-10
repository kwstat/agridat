# palenciaortiz.sugarcane.uniformity.R

libs(dplyr, reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read.csv("palenciaortiz.sugarcane.uniformity.csv", header = FALSE)

# 18 rows x 26 cols. No header.
# Basic unit plot: 2 m x 2 m
# Field width:  26 cols x 2 m = 52 m
# Field length: 18 rows x 2 m = 36 m

# Convert to long format
dat <- dat |> as.matrix() |> `colnames<-`(1:ncol(dat)) |> melt() |>
  rename(row = Var1, col = Var2, yield = value)
head(dat)

palenciaortiz.sugarcane.uniformity <- dat

## ---------------------------------------------------------------------------

dat <- palenciaortiz.sugarcane.uniformity
kw::agex(palenciaortiz.sugarcane.uniformity)

# Data check
sum(dat$yield) # matches source document 8878.03
mean(dat$yield)
sd(dat$yield)

libs(desplot)
desplot(dat, yield ~ col * row,
        flip = TRUE, tick = TRUE, aspect = 36/52,
        main = "palenciaortiz.sugarcane.uniformity")
