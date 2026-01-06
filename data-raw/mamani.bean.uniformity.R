# mamani.bean.uniformity

libs(readxl, dplyr, desplot, reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")

d1 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet1", col_names=FALSE)
d2 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet2", col_names=FALSE)
d3 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet3", col_names=FALSE)
d4 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet4", col_names=FALSE)
d5 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet5", col_names=FALSE)
d6 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet6", col_names=FALSE)
d7 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet7", col_names=FALSE)
d8 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet8", col_names=FALSE)
d9 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet9", col_names=FALSE)
d10 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet10", col_names=FALSE)
d11 <- read_excel("mamani.bean.uniformity.xlsx", "Sheet11", col_names=FALSE)

# Get even columns
d1 <- d1[ , c(2,4,6,8,10,12) ]
d2 <- d2[ , c(2,4,6,8,10,12) ]
d3 <- d3[ , c(2,4,6,8,10,12) ]
d4 <- d4[ , c(2,4,6,8,10,12) ]
d5 <- d5[ , c(2,4,6,8,10,12) ]
d6 <- d6[ , c(2,4,6,8,10,12) ]
d7 <- d7[ , c(2,4,6,8,10,12) ]
d8 <- d8[ , c(2,4,6,8,10,12) ]
d9 <- d9[ , c(2,4,6,8,10,12) ]
d10 <- d10[ , c(2,4,6,8,10,12) ]
d11 <- d11[ , c(2,4,6,8,10,12) ]

# Convert wide to tall
d1 <- melt(d1)
d2 <- melt(d2)
d3 <- melt(d3)
d4 <- melt(d4)
d5 <- melt(d5)
d6 <- melt(d6)
d7 <- melt(d7)
d8 <- melt(d8)
d9 <- melt(d9)
d10 <- melt(d10)
d11 <- melt(d11)

# The data is a single, long vector
dat <- c(d1$value, d2$value, d3$value, d4$value, d5$value, d6$value, d7$value, d8$value, d9$value, d10$value, d11$value)
length(dat) # 1680

# Variance should be 1222.09 according to source document.
mean(dat, na.rm=TRUE) # 135
var(dat, na.rm=TRUE) # 1233

# Fix outliers by hand.
range(dat, na.rm=TRUE)
which(dat==333)

# There are 20 rows in the field. But is the vector 20x84 or 84x20?

dat3 <- data.frame(expand.grid(1:20, 1:84), yield=dat)
names(dat3) <- c("row","col","yield")
# Right amount of "patchiness" with
desplot(dat3, yield~col*row, flip=TRUE, aspect=(20*.6)/(84*1))
head(dat3)

dat4 <- data.frame(expand.grid(1:84, 1:20), yield=dat) # <---------
names(dat4) <- c("row","col","yield")
 # Too many streaks, not enough patches
desplot(dat4, yield~col*row, flip=TRUE, aspect=84/20)

# If I plot the data as a time-series
plot(dat)

mamani.bean.uniformity <- dat3

kw::agex(mamani.bean.uniformity)

## ---------------------------------------------------------------------------

Page 66, expt 3, shows 20 plots combined 1x20, 74 reps. This suggests that the field is at least 20 plots long in one dimension.

page 12 translation:

The work was carried out in the experimental area known as “La Montaña”, at the Tropical Center for Teaching and Research of the IICA (PCA-CTEI) in Turrialba, Costa Rica. In December 1969, a uniformity trial was planted using the black bean variety “Turrialba-4”, which has semi-erect growth and other characteristics typical of bean varieties cultivated in Central America.

Planting was done with a two-row planter–fertilizer pulled by a tractor. The distance between rows was 0.60 m. Fertilization and other crop management practices were carried out according to the standards recommended by Pinchinat (50) for the Central American region.

In April 1970, 20 rows were harvested and divided into basic units 1 row wide and 1 m long. The dry bean grain yield obtained in each unit was recorded separately. Because the original row length varied from 55 to 102 m, the units were grouped into three sub-experiments in order to achieve the widest possible range of plot sizes and shapes. The first sub-experiment consisted of 1,080 units, the second of 1,100 units, and the third of 1,668 units.

Total precipitation during the period between planting and harvest was 721.0 mm.

page 22

The main results correspond to sub-experiment 1, since it included a greater number of plot sizes and shapes than sub-experiments 2 and 3. The results from the latter will be used to corroborate, or at least to complement, those of sub-experiment 1.

The dry beans harvested from the 1,668 basic units that make up the entire uniformity trial were weighed. The yields obtained are presented in Table 1-A of the Appendix.

4.1. Plot size

To determine the optimal plot size, various possible plot sizes were calculated with the aid of a computer:
  48 in the case of sub-experiment 1,
  24 for sub-experiment 2, and
  20 for sub-experiment 3.
For each of these plot sizes, the variances between plots and within plots were calculated. For sub-experiment 1, the results are shown in Tables 2-A and 3-A, respectively; for sub-experiment 2, in Tables 4-A and 5-A; and for sub-experiment 3, in Tables 6-A and 7-A of the Appendix.

For better understanding, the way in which the different plot sizes were arranged to be analyzed by variance components is explained below.
In the specific case of sub-experiment 1, the length of the row (54 m) was divided based on its divisibility into 1, 2, 3, 6, 9, 18, 27, and 54 m. Likewise, the rows—20 in number—were divided into 1, 2, 4, 5, 10, and 20. To form the first eight groups, 1, 5, 10, and 20 rows were combined with a single row length; and with 1, 2, 4, and 20 rows the next eight groups were formed, yielding a total of 16 groups. As can be observed, in each group the plots had different plot sizes but a single row length, and in the subsequent groups the row length was progressively increased. This explains the way in which the coefficient (b) varied and its trend. A similar procedure was followed to arrange the eight groups of sub-experiment 2.

Expt 3. Table 6a 7a

Page 33-
       5. DISCUSION
La eficacia y confiabilidad de los datos de un ensayo de campo, dependen entre otros factores del tipo de diseño utilizado y particularmente del
tamaño de las parcelas. En frijol se han hecho varias determinaciones de
tamaños de parcelas. Los tamaños óptimos encontrados van desde el de
2 m de largo por un surco de ancho según Calero (7) pasando por el de 7 rn²
de Monzon et al (38) hasta el de 12 m² como el hallado por Monzon y
Pérez (40), por lo que los resultados no ofrecen soluciones definitivas sobre el problema.
En el presente trabajo se encontraron 3 posibles tamaños óptimos de
parcela. De estas alternativas unas ofrecen más ventajas que otras si se
considera simultáneamente la forma de las parcelas.
El tamaño óptimo mínimo de 4 m de largo (4 unidades de 1 m de largo cada una) en un solo surco, se consiguić en el subensayo 3. Eu confiabilidad es menor que el de los otros tamaños por haberse basado en un
subensayo con un alto nűmero de parcelas perdidas. Este tamaño coincide
con un tamaño relativamente similar de 1 surco de 3 m de largo, reportado por Miranda (27} como áptimo para ensayos en frijol. Calero (7) en
frijol, aconseja el uso de parcelas pequeñas cuando se trata del estudio
de ciertas labores como siembra, deshierbas y aplicación de productos
químicos. En general se recomienda el empleo del tamaño mínimo óptimo
cuando se presentan ciertas circunstancias en la investigación tales como
la poca disponibilidad de semilla y durante los primeros años de la selección varietal.
El tamaño máximo óptimo con 10 m de largo (10 unidades en un
surco) fue obtenido en el subensayo 2, a partir del promedio de los
coeficientes de regresión no ponderados. Este tamaño aproximadamente
coincide con el determinado para frijol por Loesell (31), quien recomienda
parcelas de 9 m de largo y un surco de ancho. Calero (7) en frijol recomienda el uso de parcelas grandes para el estudio de labores como preparación del terreno y métodos de cosecha. El tamaño correspondiente a
10 m de largo sería recomendable cuando en los diseños experimentales
las labores sean efectuadas en forma mecanizada.
El tamaño medio óptimo de 6-7 unidades básicas es evidentemente
el mejor por las siguientes razones: a) ha sido obtenido a partir del promedio de los coeficientes ajustados por la ponderación (Cuadro 4) los
cuales tuvieron el mismo valor en los subensayos 1 y 2 b) es resultado de
un análisis en el que intervino un mayor nűmero de tamaños y formas de
parcelas, que en los resultados anteriores, c) su forma óptima corresponde a 2 surcos de 3 m de largo, aproximandose más a la forma rectangular; d) fue confirmado por optimización mediante la aplicación de modelos matemáticos adecuados. Gartner y Cardona (18) encontraron un
tamaño ptimo de parcela para frijol de 2 surcos de 4 m, que se asemeja
al encontrado en este estudio. El tamaño medio obtenido puede ser usado
en cualquier tipo de estudio o investigación en frijol que sea cuantificado
a través del rendimiento.
Inversamente a lo que sucede en la forma de la parcela, en cuanto
que la óptima es la alargada y estrecha, en el bloque se prefiere la cuadrada o cercana a esta. Si por razones de forma de bloque relacionamos
el nűmero de tratamientos con el número de repeticiones, la mejor forma
de bloque vendría a ser la de 4 repeticiones de la parcela de 2 surcos por
3 m de largo. Resultados parecidos obtuvieron en frijol Gartner y Cardona
(18), salvo que el largo del surco indicado por ellos era de 4 m. La
forma menos aceptable de bloque fue aquella con 3 repeticiones, la que
correspondió a la parcela de 1 x 10.
En la determinación del tamaño óptimo de cualquier parcela inter.
vienen dos factores principales: la variabilidad del material experimental
y los costos.
En los experimentos de campo la variabilidad del suelo como material experimental es de primera consideración. La mayoría de los investigadores detectan la variabilidad de un suelo por intermedio del análisis
de regresión en donde el coeficiente (b) mide, según Nonnecke (44), además, la correlación entre parcelas adyacentes. Si se observan los coefi -
cientes de regresión de los 16 grupos del subensayo 1 (Cuadro 3), se nota
que se distribuyen siguiendo una curva parabólica. Esto indica que al
aumentar el tamaño de las unidades básicas en una misma área experimental la eficiencia disminuye a medida que aumenta el error, lo cual se
induce por la reducción correspondiente del número de repeticiones. Esto
muestra que el concepto generalmente propuesto que "a medida que aumenta el tamaño de parcela disminuye la variabilidad", tiene un limite. Esto
se demuestra al observar los resultados del subensayo 1 (Cuadro 3) donde
el grupo 1 corresponde al tamaño de la unidad primaria más pequeña y
esta va en aumento hasta llegar a un máximo tamaño en el grupo 8 (tendencia lineal). El valor del coeficiente en el grupo 1 es de b₂ =.91, el cual
expresa alta variabilidad y conforme va aumentando el tamaño de la parcela (grupos 2 y 3) el valor del coeficiente va decreciendo, hasta llegar a
un valor mínino en el grupo 4 (b₂ =.53). Esto quiere decir que la eficiencia del incremento del tamaño de la parcela para reducir el error
llega a su máximo con el tamaño correspondiente al grupo 4: pero a partir
del grupo 5 en adelante hay un nuevo aumento del valor del coeficiente a
pesar de seguir incrementandose el tamaño de las parcelas. Esto lo confirma el trabajo de Emith (56) en frijol.
De los resultados del ensayo se deduce que en general en la determinación del tamaño al costo total por parcela no tiene mucha importancia,
sino más bien su distribución proporcional en los coeficientes K₁ у К₂.
La mayor proporción de K1 en relación a K2 en este estudio coincide con
los resultados obtenidos por Weber y Horner (66) en soya, aplicandose
también una regresión lineal simple. En cambio Robinson et al (53) en
maní, se valieron de una encuenta para determinar los valores de K₁y K2.
De estos métodos se prefiere el que usa los coeficientes de la regresiőn
lineal por su mayor exactitud. Se asignaron a K₁ las labores de toma de
notas y análisis estadístico debido a que la mayor parte de la bibliografía
consultada sigue ese procedimiento. Pero Wiedemann y Leininger (67)
en cártamo asignaron a K2 un 25% de la labor de toma de notas y 5% del
análisis estadistico. Sin embargo, aún aplicándose esta modificación a
los resultados del presente estudio no se cambiarían de manera significativa la relación entre K₁ y K2.
La omisión de los bordes de parcela no debería afectar seriamente
los resultados en este estudio, si se toma en cuenta que Monzőn et al
(41, 42) trabajando con frijol encontraron que no hubo efecto de competencia entre parcelas y por lo tanto no se requieren de borduras en parcelas
de un mismo bloque. Asi mismo Zuhlke y Gritton (71) en arveja obtuvieron como tamaño optimo 3.3 m² sin bordes y 3.1 m² con bordes, lo cual
en la práctica representaria poca diferencia. Además las inclusión de
bordes a la parcela incrementaría los costos.
En el ensayo de uniformidad básico de este estudio se introdujo una
modificación a la metodologia común, con la finalidad de lograr un mejor
aprovechamiento de los datos. El ensayo original fue dividido en 3 subensayos "teóricos" y cada uno fue analizado varias veces con diferentes
tamaños y formas de parcela. Se hicieron 26 análisis, lo que equivaldria
a resultados de 26 diseños experimentales (latices por ejemplo) con el
consiguiente incremento de las dificultades y los costos inherentes.
Tambiến las modificaciones introducidas a las fórmulas de Hatheway
y Williams (22) de los coeficientes de regresión ponderados y su optimización con modelos matemáticos, ayudaron a refinar la metodología para
obtener el tamaño óptimo de parcela.
La modificación de la fórmula [4] de Hatheway y Williams (22) consistiő en que ésta fue reemplazada por la fórmula general para la solución
de ecuaciones lineales mediante el método de cuadrados mínimos [ 7] у
[ 8], para poder ser aplicada a la computadora con cualquier nűmero de
tamaños diferentes de parcela y en cualquier diseño experimental.
Fueron empleados varios métodos para obtener los coeficientes de
regresión y su respectivo ajuste por ponderación. Analizando los coeficientes obtenidos en el subensayo 3, el ajuste de b1 = 1.52 a b2 = 1.48
mediante la főrmula de Federer (12) es relativamente pequeño. Un resultado similar con esta misma fórmula obtuvo Stickler (60) en sorgo de
grano. De allf se deduce que la fórmula de Federer es muy débil para
realizar ajustes en comparación con la de Hatheway y Williams (22). Asĩ
al aplicar ésta en el mismo subensayo 3, ajustamos el valor de b1 = 1.52
a b2 =.59. Los ajustes logrados en los subensayos 1 y 2 fueron de menor
cuantía porque posiblemente los valores no ponderados se aproximaban al
verdadero (b) y además, las variancias se mostraron más uniforme.

English:

Page 33- 5. DISCUSSION

The effectiveness and reliability of the data from a field trial depend, among other factors, on the type of design used and particularly on the plot size. In beans, several determinations of plot sizes have been made. The optimal sizes found range from 2 m in length by one row in width according to Calero (7), through 7 m² as reported by Monzón et al. (38), up to 12 m² as found by Monzón and Pérez (40). Thus, the results do not offer definitive solutions to the problem.

In the present work, three possible optimal plot sizes were found. Among these alternatives, some offer more advantages than others if the plot shape is considered simultaneously.

The minimum optimal size of 4 m in length (4 units of 1 m length each) in a single row was obtained in subtrial 3. Its reliability is lower than that of the other sizes because it was based on a subtrial with a high number of lost plots. This size coincides with a relatively similar size of one row 3 m long, reported by Miranda (27) as optimal for bean trials. Calero (7), in beans, advises the use of small plots when studying certain operations such as planting, weeding, and application of chemical products. In general, the minimum optimal size is recommended when certain circumstances arise in research, such as limited seed availability and during the early years of varietal selection.

The maximum optimal size of 10 m in length (10 units in one row) was obtained in subtrial 2, based on the average of the unweighted regression coefficients. This size approximately coincides with that determined for beans by Loesell (31), who recommends plots 9 m in length and one row in width. Calero (7), in beans, recommends the use of large plots for studying operations such as land preparation and harvest methods. The size corresponding to 10 m in length would be advisable when operations in the experimental designs are carried out mechanized.

The medium optimal size of 6–7 basic units is evidently the best for the following reasons: a) it was obtained from the average of the coefficients adjusted by weighting (Table 4), which had the same value in subtrials 1 and 2; b) it results from an analysis in which a larger number of plot sizes and shapes were involved than in the previous results; c) its optimal shape corresponds to 2 rows 3 m in length, more closely approximating a rectangular form; d) it was confirmed by optimization through the application of suitable mathematical models. Gartner and Cardona (18) found an optimal plot size for beans of 2 rows 4 m long, which resembles that found in this study. The medium size obtained can be used in any type of study or research in beans that is quantified through yield.

Contrary to what happens with plot shape—where the optimal is long and narrow—in block shape, a square or near-square is preferred. If, for reasons of block shape, we relate the number of treatments to the number of replications, the best block shape would be 4 replications of the plot of 2 rows by 3 m in length. Similar results were obtained in beans by Gartner and Cardona (18), except that the row length they indicated was 4 m. The least acceptable block form was the one with 3 replications, which corresponded to the 1 × 10 plot.

Two main factors are involved in determining the optimal size of any plot: the variability of the experimental material and the costs.

In field experiments, soil variability as experimental material is of primary importance. Most researchers detect the variability of a soil through regression analysis, in which the coefficient (b) measures, according to Nonnecke (44), the correlation between adjacent plots as well. If the regression coefficients of the 16 groups in subtrial 1 (Table 3) are observed, they are seen to follow a parabolic curve. This indicates that as the size of the basic units increases within the same experimental area, efficiency decreases as error increases, which is induced by the corresponding reduction in the number of replications. This shows that the generally proposed concept that “as plot size increases, variability decreases” has a limit. This is demonstrated by observing the results of subtrial 1 (Table 3), where group 1 corresponds to the smallest primary unit size, which increases up to a maximum size in group 8 (linear trend). The coefficient value in group 1 is b₂ = .91, which expresses high variability, and as plot size increases (groups 2 and 3) the coefficient value decreases until reaching a minimum in group 4 (b₂ = .53). This means that the efficiency of increasing plot size to reduce error reaches its maximum with the size corresponding to group 4; but from group 5 onward there is a new increase in the coefficient value despite continuing to increase the plot size. This is confirmed by the work of Emith (56) in beans.

From the trial results it can be deduced that, in general, in determining size the total cost per plot is not very important; rather, it is the proportional distribution into coefficients K₁ and K₂. The larger proportion of K₁ in relation to K₂ in this study coincides with the results obtained by Weber and Horner (66) in soybean, also applying a simple linear regression. In contrast, Robinson et al. (53) in peanut used a survey to determine the values of K₁ and K₂. Of these methods, the one that uses the coefficients from linear regression is preferred for its greater accuracy. The tasks of note-taking and statistical analysis were assigned to K₁ because most of the literature consulted follows that procedure. However, Wiedemann and Leininger (67) in safflower assigned to K₂ 25% of the note-taking and 5% of the statistical analysis. Even applying this modification to the results of the present study would not significantly change the relationship between K₁ and K₂.

Omitting plot borders should not seriously affect the results in this study, considering that Monzón et al. (41, 42), working with beans, found that there was no competition effect between plots and therefore borders are not required within plots of the same block. Likewise, Zuhlke and Gritton (71) in pea obtained an optimal size of 3.3 m² without borders and 3.1 m² with borders, which in practice would represent little difference. Moreover, including borders in the plot would increase costs.

In the basic uniformity trial of this study, a modification to the common methodology was introduced in order to make better use of the data. The original trial was divided into three “theoretical” subtrials and each was analyzed several times with different plot sizes and shapes. A total of 26 analyses were carried out, which would be equivalent to results from 26 experimental designs (lattices, for example), with the consequent increase in difficulties and inherent costs.

The modifications introduced to the Hatheway and Williams (22) formulas for weighted regression coefficients, and their optimization with suitable mathematical models, also helped refine the methodology for obtaining the optimal plot size.

The modification to formula [4] of Hatheway and Williams (22) consisted of replacing it with the general formula for solving linear equations by the least squares method [7] and [8], so that it could be applied by computer with any number of different plot sizes and in any experimental design.

Several methods were used to obtain the regression coefficients and their respective weighting adjustment. Analyzing the coefficients obtained in subtrial 3, the adjustment from b1 = 1.52 to b2 = 1.48 by Federer’s formula (12) is relatively small. Stickler (60) obtained a similar result with this same formula in grain sorghum. From this it follows that Federer’s formula is very weak for making adjustments compared with that of Hatheway and Williams (22). Thus, when applying the latter in the same subtrial 3, we adjusted the value from b1 = 1.52 to b2 = .59. The adjustments achieved in subtrials 1 and 2 were smaller, possibly because the unweighted values were closer to the true (b) and, in addition, the variances appeared more uniform.


Page 41

This study aimed at determining the optimum size, shape, and number of replications of the experimental field plot in common dry beans
(Phaseolus vulgaris L.), and also at modifying the procedure usually
applied to arrive at such determination.
A black-seeded semi-bush bean variety "Turrialba-4" was used. A
soil homogeneity test was set up and divided into 3 theoretical sub-tests,
yielding a wider range of plot sizes and shapes. Thus, were analyzed 92
shapes, which represented the equivalent of 26 separate experimental
designs.
The procedure followed to determine plot size consisted in combining the one developed by Smith (57) with another developed by Hatheway
and Williams (22). The optimization of the plot size was obtained through
the application of two mathematical models. The optimum plot shape was
determined by applying Bartlett's test for homogeneity of variances and
the F test.
The optimum number of replications was determinated through the
procedure developed by Kempthorne (25).
Alternatively 3 optimum plot sizes were found:
a. The smallest: 4 m long and 1 row wide, with 5 replications.
b. The largest: 10 m long and 1 row wide, with 3 replications.
c. The medium: 3 m long and 2 row wide, with 4 replications.
This medium plot size is recommended for field trials in beans.


