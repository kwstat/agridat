# trought.cotton.uniformity.R

# Data were typed and proofread by KW 2024.12.20

libs(dplyr,readxl,reshape2)
setwd("c:/drop/rpack/agridat/data-raw/")
dat1 <- read_excel("trought.cotton.uniformity.xlsx", col_names = FALSE)

# Convert to long format
dat1 <- dat1 |> as.matrix() |> `colnames<-`(1:8) |> melt() |>
  rename(row=Var1, col=Var2, yield=value)
head(dat1)
trought.cotton.uniformity <- dat1

## ---------------------------------------------------------------------------

dat <- trought.cotton.uniformity

# Data check
summary(dat$yield)
sum(dat$yield) # 
libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(24*.9)/(8*12.5),
        main="trought.cotton.uniformity")
