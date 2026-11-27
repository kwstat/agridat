# cordoba.corn.R

# Cordoba, M., Paccioretti, P. and Balzarini, M. (2026).
# ofemeantest: On Farm Experimentation Mean Test. R package version 1.0.0.
# https://CRAN.R-project.org/package=ofemeantest
# Dataset 'ofe_f2', an sf object with 3070 points.

# The same trial is described as field F2 in
# Cordoba, M., Paccioretti, P. and Balzarini, M. (2024).
# On-Farm single strip treatment trials. CONICET. (dataset).
# http://hdl.handle.net/11336/236743

# In the ofemeantest repository, ofe_f2 is built by data-raw/ofe_f2.R from the
# file F2_BD_P_2020.gpkg: yield (Rinde_kg, kg/ha) is divided by 1000,
# records with yield of 9.8 t/ha or more are dropped, and the treatment labels
# 'Aplicado' and 'Testigo' are translated to 'Fertilized' and 'Control'.

libs(sf)

data("ofe_f2", package = "ofemeantest")
packageVersion("ofemeantest") # 1.0.0
st_crs(ofe_f2)$epsg # 32720, WGS 84 / UTM zone 20S

# Coordinates (meters) and yield are kept as in the source, without rounding.
# Rounding the coordinates (to 0.1 mm or to 1 cm, for example) moves the
# effective sample size of the OFE-mean test from 89 to 90.
xy <- st_coordinates(ofe_f2)
dat <- data.frame(
  x = xy[, "X"],
  y = xy[, "Y"],
  trt = ofe_f2$Treatment,
  yield = ofe_f2$Yield_tn
)
cordoba.corn <- dat

## ---------------------------------------------------------------------------

# Data check
dim(dat) # 3070 4
table(dat$trt)
#    Control Fertilized
#       1499       1571
aggregate(yield ~ trt, data = dat, FUN = mean)
#          trt    yield
# 1    Control 4.808147
# 2 Fertilized 5.312872

libs(lattice)
xyplot(y ~ x, data = dat, groups = trt, aspect = "iso", auto.key = TRUE,
       main = "cordoba.corn")

# Export as tab-delimited text with LF line endings
con <- file("../data/cordoba.corn.txt", "wb")
write.table(dat, con, sep = "\t", row.names = FALSE, eol = "\n")
close(con)

# The text file has 15 significant digits. Compare it with the source.
chk <- read.table("../data/cordoba.corn.txt", header = TRUE)
max(abs(cbind(chk$x, chk$y) - xy)) # 4.7e-09
max(abs(chk$yield - ofe_f2$Yield_tn)) # 1.8e-15
all(chk$trt == ofe_f2$Treatment) # TRUE
