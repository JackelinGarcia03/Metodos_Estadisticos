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
paraje <- shapiro.test
shapiro.test(paraje$DAP)
shapiro.test(paraje$EDAD)
