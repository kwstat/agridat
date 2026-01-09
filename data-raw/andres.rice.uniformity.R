25

Location: The project to determine a suitable experimental unit size for rice (Oryza sativa) trials, using the maximum curvature method, was conducted in the Alfredo Baquerizo Moreno canton of the Guayas province.
Timeframe: This project was carried out between the months of January and May 2021.

33

3.1 Research Approach

3.1.1 Type of research Within the context of this study, this research is considered experimental in that it seeks to find the appropriate plot size for definitive experiments in rice. It also has a descriptive component, which is defined by the response variable used to establish these sizes.

3.1.2 Research Design It is an experimental design because the different sizes of experimental units for the rice crop in the Alfredo Baquerizo Moreno canton are evaluated. The yield of each experimental unit is evaluated to obtain the coefficient of variation. The experimental design comprises 990 units.

39

3.2.4  Determinación de coeficiente de variación 
Para  la  obtención  del  coeficiente  de  variación  dividimos  el  área  total  del 
proyecto en 990 unidades experimentales, las cuales tuvieron un área de 0,9 m 2  
cada  una.  Estas  unidades  básicas  permitieron  formar  diferentes  tamaños  de 
parcelas, desde 0,9 a 72 m 2 . Esta última dimensión considerada fue establecida 
previamente en función de las publicaciones en la literatura pertinente respecto 
a ensayos de arroz, en las cuales es común la dimensión de 8 unidades básicas 
de ancho por 10 unidades básicas de largo.

60

Field width: 33 columns x 0.9 m = 29.7 m

Field length: 30 rows x 1 m = 30 m

## ---------------------------------------------------------------------------

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("andres.rice.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

dat <- andres.rice.uniformity

var(dat$yield) # 5611.803 match andres

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(30*1)/(33*0.9),
        main="andres.rice.uniformity")

andres.rice.uniformity <- dat

kw::agex(andres.rice.uniformity)

