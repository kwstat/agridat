
Gilberto Paez Bogarin (1962).
Estudios sobre tamaño y forma de parcela para ensayos en cafe.
Instituto Interamericano de Ciencias Agricolas de la O.E.A. Centro Tropical de Investigacion y Ensenanza para Graduados. Costa Rica.
http://hdl.handle.net/11554/1892

libs(desplot,lattice,readxl,reshape2)
dat <- read_excel("c:/x/rpack/agridat/data-raw/paez.coffee.uniformity.xlsx")
#dat <- melt(dat, id.vars=c('plot'))
desplot(`1` ~ col*row, dat, tick=TRUE)
desplot(`2` ~ col*row, dat, tick=TRUE)
desplot(`3` ~ col*row, dat, tick=TRUE)
desplot(`4` ~ col*row, dat, tick=TRUE)
desplot(`5` ~ col*row, dat, tick=TRUE)
xyplot( ~ variable, dat, groups=plot, type='l')
xyplot(value ~ variable|plot, dat, type='l')
