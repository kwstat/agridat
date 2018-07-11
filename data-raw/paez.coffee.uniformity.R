
Gilberto Paez Bogarin (1962).
Estudios sobre tamaño y forma de parcela para ensayos en cafe.
Instituto Interamericano de Ciencias Agricolas de la O.E.A. Centro Tropical de Investigacion y Ensenanza para Graduados. Costa Rica.
http://hdl.handle.net/11554/1892

The field map on page 56, has plots 1 to 838.
The data tables on page 79-97 have data for plots 1 to 900.
Paez looks at blocks that are 1,2,...36 trees in size.
Page 30 shows annual CV.

libs(desplot,dplyr,lattice,readxl,reshape2)
dat <- read_excel("c:/x/rpack/agridat/data-raw/paez.coffee.uniformity.xlsx")
dat[,4:8] <- dat[,4:8]/10
desplot(`Y1` ~ col*row, dat,
        tick=TRUE, aspect=1,
        main="paez.coffee.uniformity - Y1")
desplot(`Y2` ~ col*row, dat,
        tick=TRUE, aspect=1,
        main="paez.coffee.uniformity - Y2")
desplot(`Y3` ~ col*row, dat,
        tick=TRUE, aspect=1,
        main="paez.coffee.uniformity - Y3")
desplot(`Y4` ~ col*row, dat,
        tick=TRUE, aspect=1,
        main="paez.coffee.uniformity - Y4")
desplot(`Y5` ~ col*row, dat,
        tick=TRUE, aspect=1,
        main="paez.coffee.uniformity - Y5")
datt <- melt(dat, id.vars=c('plot','row','col'))
datt <- rename(datt, yield=value, year=variable)
paez.coffee.uniformity <- datt
pairs(dat[,4:8])
