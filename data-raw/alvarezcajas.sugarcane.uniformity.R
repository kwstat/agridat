# alvarezcajas.sugarcane.uniformity.R

libs(dplyr, reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read.csv("alvarezcajas.sugarcane.uniformity.csv", header = FALSE)

# 40 rows x 15 cols. No header.
# Field: 15 cols * 1.6 m wide = 24 m wide
#        40 rows * 2 m long  = 80 m long
# Each plot: 1.6 m x 2 m = 3.2 sq m

# Convert to long format
dat <- dat |> as.matrix() |> `colnames<-`(1:ncol(dat)) |> melt() |>
  rename(row = Var1, col = Var2, yield = value)
head(dat)

alvarezcajas.sugarcane.uniformity <- dat

## ---------------------------------------------------------------------------

dat <- alvarezcajas.sugarcane.uniformity
kw::agex(alvarezcajas.sugarcane.uniformity)

# Data check
mean(dat$yield)  # source 27.1445
sd(dat$yield)    # source 

libs(desplot)
desplot(dat, yield ~ col * row,
        flip = TRUE, tick = TRUE, aspect = 80/24,
        main = "alvarezcajas.sugarcane.uniformity")
