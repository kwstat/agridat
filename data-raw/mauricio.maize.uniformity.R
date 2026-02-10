# 0_template.R
# Time-stamp: <2026-02-02 14:41:03 wrightkevi>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("mauricio.maize.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(26*1)/(26*1), tick=TRUE,
        main="mauricio.maize.uniformity")

mauricio.maize.uniformity <- dat

agex(mauricio.maize.uniformity, prompt=FALSE)

Tal como se ha mencionado en el párrafo anterior, este estudio tiene característica 
experimental, dado que se desarrolló un experimento de uniformidad con maíz, en el 
cual  se  demarcaron  unidades  básicas  de  1.0  m 2 .  En  este  ensayo  se  valoró  el 
rendimiento, con cuyos datos se generaron los coeficientes de variación de diferentes 
combinaciones  que  posteriormente  se  analizaron  bajo  un  modelo  de  regresión 
múltiple con el fin de identificar el tamaño óptimo de parcela de maíz en la zona de 
estudio.

As mentioned in the previous paragraph, this study has an experimental characteristic, given that a uniformity experiment with corn was developed, in which basic units of 1.0 m² were demarcated. In this trial, yield was evaluated, and with this data, coefficients of variation were generated from different combinations that were subsequently analyzed under a multiple regression model in order to identify the optimal plot size for corn in the study area.

Bajo  el  contexto  de  este  estudio,  el  experimento  desarrollado  es  un  ensayo  de 
uniformidad de forma cuadrada, cuyo lado  fue de 30 m, dejando 2 m como borde 
perimetral. Esto último permitió tener un área neta de 676 m 2  con la dimensión de 26 
m x 26 m. Para la generación de los coeficientes de variación se consideró realizar 
combinaciones (unidades secundarias) desde 1 x 1 hasta de 9 x 9 unidades básicas.

Within the context of this study, the experiment developed is a uniformity trial with a square shape, whose side was 30 m, leaving 2 m as a perimeter border. This allowed for a net area of 676 m² with dimensions of 26 m x 26 m. For the generation of coefficients of variation, combinations (secondary units) ranging from 1 x 1 to 9 x 9 basic units were considered.

 Conclusiones 
Entre todas las combinaciones de unidades básicas para obtener el tamaño óptimo 
de parcela se tuvo una variabilidad mínima de 1.3% y una máxima de 8.0%; bajo estas 
condiciones de un suelo heterogéneo. El tamaño óptimo de parcela experimental de 
maíz, según el método de regresión múltiple, es de 9.0 m de ancho y 6.0 m de largo; 
esto es, un tamaño de 54.0 m 2  para los experimentos que se realizan en la zona 
agrícola de Simón Bolívar.

Conclusions
Among all the combinations of basic units to obtain the optimal plot size, there was a minimum variability of 1.3% and a maximum of 8.0%; under these conditions of heterogeneous soil. The optimal experimental plot size for corn, according to the multiple regression method, is 9.0 m wide and 6.0 m long; that is, a size of 54.0 m² for experiments conducted in the agricultural zone of Simón Bolívar.


