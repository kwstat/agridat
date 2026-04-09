# athulya.rice.uniformity.R

libs(dplyr, reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read.csv("athulya.rice.uniformity.csv", header = FALSE)

# 20 rows x 20 cols. No header.
# Basic unit plot: 1.2 m x 1.2 m
# Field width:  20 cols x 1.2 m = 24 m
# Field length: 20 rows x 1.2 m = 24 m

# Convert to long format
dat <- dat |> as.matrix() |> `colnames<-`(1:ncol(dat)) |> melt() |>
  rename(row = Var1, col = Var2, yield = value)
head(dat)

# Un-standardize the data. The source document contains a table of "normalized"
# yield values, which are the raw yield minus the mean, divided by the standard
# deviation. The source document does not contain the mean and standard
# deviation, but we can calculate them from the data. The mean and standard deviation calculated from this data is slightly different from the source. The table of basic unit yield
# Average yield is 391.13

# Fertility gradient = (y - ymean) / ymean
# y = ymean + (fertility gradient * ymean) * 100
dat <- dat |> mutate(yield = 391.13 + (yield/100 * 391.13))
head(dat)
mean(dat$yield) # source says 391.13
range(dat$yield) # source says 200 to 650

athulya.rice.uniformity <- dat
kw::agex(athulya.rice.uniformity, prompt=FALSE)

## ---------------------------------------------------------------------------

dat <- athulya.rice.uniformity

# Data check
mean(dat$yield)  # ~0 (normalized values)
sd(dat$yield)    # ~26.3

libs(desplot)
# matches the heatmap in the source
desplot(dat, yield ~ col * row,
        flip = TRUE, tick = TRUE, aspect = 1.2/1.2,
        main = "athulya.rice.uniformity")

