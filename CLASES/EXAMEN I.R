# J_Garcia
# 12/10/2022
# Examen I

library(repmis)
suelo1 <- read.csv("CLASES/suelo.csv")

#¿Cuántas veces es la diferencia entre la varainza más pequeña y la más grande?
tapply(suelo1$nematodos, suelo1$suelo, mean)
tapply(suelo1$nematodos, suelo1$suelo, median)
tapply(suelo1$nematodos, suelo1$suelo, sd)
tapply(suelo1$nematodos, suelo1$suelo, var)
#es seis veces mayor a el resultado con mayor varianza, es decir, mientras que el mas
#pequeño viene siendo S5 con 90.8 y el mayor osea S1 con 571.7.
tapply(suelo1$nematodos, suelo1$suelo, length)

#¿Observamos diferencias en los valores promedios y de variabilidad por grupos?
boxplot(suelo1$nematodos ~ suelo1$suelo)
#que los valores promedios son de 148.8 140.8 130.4 100.4 161.6 mientras que los de 
#variabilidad son de 571.7 302.7 285.8 189.3  90.8, es decir que, estos varian, habiendo
#una diferencia en el S1 de 422.9 en el S2 de 161.9, el S3 de 155.4, en el S4 de 88.9
#y el el S5 de 70.5 sobre el promedio y variabilidad de cada uno de los suelos.

#¿Cuáles serían las hipótesis nula y alternativa?
par.aov <- aov(suelo1$nematodos ~ suelo1$suelo)
summary(par.aov)
#H1 = SI HAY DIFERENCIAS SIGNIFICATIVAS ENTRE LOS SITIOS (Analisis de Varianza)
#H0 = NO HAY DIFERENCIAS SIGNIFICATIVAS ENTRE LOS SITIOS (Analisis de Varianza)

#----Describe los resultados obtenidos indicando cuál es el valor del estadístico de 
#contraste (F), los gradosde libertad del factor, los grados de libertad residuales 
#y el valor de P----.
#-RESPUESTAS------------------------------------------------------------------------
#V.estadistico de contraste F = 0.000207
#Los grados de Libertad = 4
#Grados de libertad residuales = 20
#Valor de P = 9.287

TukeyHSD(par.aov) 
# S2-S1 = si hay diferencias significativas entre estas dos. (No tocan el 0)
# S3-S1 = si hay diferencias significativas entre estas dos. (No tocan el 0)
# S4-S1 = no hay diferencias significativas entre estas dos. (Va desde el negativo al postivio)
# S5-S1 = si hay diferencias significativas entre estas dos. (No tocan el 0)
# S3-S2 = no hay diferencias significativas entre estas dos. (Van desde el negativo al positivo)
# S4-S2 = no hay diferencias significativas entre estas dos. (Va desde el negativo al postivio)
# S5-S2 = si hay diferencias significativas entre estas dos. (No tocan el 0)
# S4-S3 = si hay diferencias significativas entre estas dos. (No tocan el 0)
# S4-S3 = si hay diferencias significativas entre estas dos. (No tocan el 0)
# S5-S3 = si hay diferencias significativas entre estas dos. (No tocan el 0)
# S5-S4 = si hay diferencias significativas entre estas dos. (No tocan el 0)

plot(TukeyHSD(par.aov))
# Letras iguales no hay diferencias
# Letras diferentes si hay diferencias
------------------------------------------------
# lo que toque la linea del 0 hay diferencias
# lo que no toque la linea del 0 hay diferencias

#¿Cual seria tu conclusion en el contexto del problema?
#RESPUESTA----------------------------------------------------------------------------
#Que hay una 95% de nivel de confianza de acuerdo a la tabla.