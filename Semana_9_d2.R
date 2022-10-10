# J_Garcia
# Analisis de Varianza (ANOVA)
# Semana 9_d2

#TIENE DOS CONDICIONES A CUMPLIR:
  # Normalidad  (Shapiro.Test)
  # Homogeniedad de Varianza (Barlett.test)

library(repmis)
paraje <- source_data("https://www.dropbox.com/s/fbrwxypacjgeayj/Datos_Rascon_Anova.csv?dl=1")

tapply(paraje$DAP, paraje$Paraje, mean)
tapply(paraje$DAP, paraje$Paraje, median)
tapply(paraje$DAP, paraje$Paraje, sd)
tapply(paraje$DAP, paraje$Paraje, var)
tapply(paraje$DAP, paraje$Paraje, length)

boxplot(paraje$DAP ~ paraje$Paraje)
      xlab = "Paraje"
      ylab = "DAP (cm)"
      col = "purple"

paraje <- shapiro.test
shapiro.test(paraje$DAP)
shapiro.test(paraje$EDAD)

# Homogeniedad de varianzas barlett.test

bartlett.test(paraje$DAP, paraje$Paraje)
# H0 = las varianzas son homogeneas (o.08 es mayor a 0.05, es dcir las varianzas
#son homogeneas aunque la variazion entre laguna es el doble, por eso siguen 
#siengo homogeneas)
# H1 = las varianzas no son homogeneas

# Normalidad de la variable DAP
shapiro.test(paraje$DAP)
hist(paraje$DAP)

library(dplyr)

chinatu <- paraje %>%
  filter(Paraje == "Chinatu")
 shapiro.test(chinatu$DAP)
 #Es normal

 trinidad <- paraje %>%
   filter(Paraje == "Trinidad")
   shapiro.test(trinidad$DAP)
#Es normal
   
  laguna <- paraje %>%
  filter(Paraje == "Laguna")
shapiro.test(laguna$DAP)
#Es normal

tule <- paraje %>%
  filter(Paraje == "Tule")
shapiro.test(tule$DAP)   
hist(tule$DAP)

par.aov <- aov(paraje$DAP ~ paraje$Paraje)
summary(par.aov)

#H1 = SI HAY DIFERENCIAS SIGNIFICATIVAS ENTRE LOS SITIOS (Analisis de Varianza)
#H0 = NO HAY DIFERENCIAS SIGNIFICATIVAS ENTRE LOS SITIOS (Analisis de Varianza)

# Observación = "Prueba de Tukey" (si la prueba de ANOVA arroja que hay diferencia de sitios 
# se aplica esta prueba)
------------------------------------------------------------------------------------------------
# Como la prueba de ANOVA (aov) me dice que hay diferencias significativas,
# entonces procedo con la Prueba de Tukey.
# La prueba de Tukey identificara donde estan las diferencias.

TukeyHSD(par.aov)
# Laguna-Chinatu = si hay diferencias significativas entre estas dos. (No tocan el 0)
# Trinidad-Chinatu = si hay diferencias significativas entre estas dos. (No tocan el 0)
# Tule-Chinatu = no hay diferencias significativas entre estas dos. (Va desde el negativo al postivio)
# Trinidad-Laguna = si hay diferencias significativas entre estas dos. (No tocan el 0)
# Tule-Laguna = no hay diferencias significativas entre estas dos. (Van desde el negativo al positivo)
# Tule-Trinidad = si hay diferencias significativas entre estas dos. (No tocan el 0)

plot(TukeyHSD(par.aov))
# Letras iguales no hay diferencias
#Letras diferentes si hay diferencias
------------------------------------------------
# lo que toque la linea del 0 hay diferencias
# lo que no toque la linea del 0 hay diferencias