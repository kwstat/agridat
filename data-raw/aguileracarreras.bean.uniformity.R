# aguileracarreras.bean.uniformity.R

The experiment was grown near Santa Ana, El Salvador, in 1964.

The experimental plot was divided into 256 plots of 5 x 5 m. each. In each of the 256 plots, soil samples were taken — consisting of six borings from 0 to 30 cm. in depth — for the determination of phosphorus and potassium levels. In June 1964 the plots were planted to coffee, then in August 1964 a crop of beans was planted in double rows between the coffee trees.

Although the primary objective of the experiment related to coffee, a uniformity study was conducted with bean (*Phaseolus vulgaris*) of the variety Porrillo No 1. The reason for using bean was the need to use a crop that could be harvested in a relatively short period of time.

Aguilera Carreras, José Rutilio (1969).
Heterogeneidad de un suelo latosol pardo forestal en un lote experimental de fertilización en café.
Thesis, Universidad de El Salvador
https://hdl.handle.net/20.500.14492/29100
Reviewed. Data. 

libs(dplyr,reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read.csv("aguileracarreras.bean.uniformity.csv", header=FALSE)

# Convert to long format
dat <- dat |> as.matrix() |> `colnames<-`(1:ncol(dat)) |> melt() |>
  rename(row=Var1, col=Var2, yield=value)
head(dat)
aguileracarreras.bean.uniformity <- dat

## ---------------------------------------------------------------------------

dat <- aguileracarreras.bean.uniformity
kw::agex(aguileracarreras.bean.uniformity)
# Data check
summary(dat$yield)
sum(dat$yield)
libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=15/16,
        main="aguileracarreras.bean.uniformity")
