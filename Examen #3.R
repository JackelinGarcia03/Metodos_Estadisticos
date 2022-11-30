# J_Garcia
# 30/11/2022
# Examen III

#EJERCICIO 1--------------------------------------------------------------------

library(repmis)
suelo1 <- read.csv("Datos/Examen III.csv" , header= T)

tapply(suelo1$nematodos, suelo1$suelo, mean)
tapply(suelo1$nematodos, suelo1$suelo, median)
tapply(suelo1$nematodos, suelo1$suelo, sd)
tapply(suelo1$nematodos, suelo1$suelo, var)
tapply(suelo1$nematodos, suelo1$suelo, length)

boxplot(suelo1$nematodos ~ suelo1$suelo)

par.aov <- aov(suelo1$nematodos ~ suelo1$suelo)
summary(par.aov)

TukeyHSD(par.aov) 

plot(TukeyHSD(par.aov))

#EJERCICIO 2--------------------------------------------------------------------

library(repmis)
tratamiento <- read.csv("Datos/Tratamientos.csv" , header= T)

boxplot(tratamiento$Regimen~ tratamiento$Crecimiento)

tapply(tratamiento$Regimen, tratamiento$Crecimiento, mean)
tapply(tratamiento$Regimen, tratamiento$Crecimiento, median)
tapply(tratamiento$Regimen, tratamiento$Crecimiento, sd)
tapply(tratamiento$Regimen, tratamiento$Crecimiento, var)
tapply(tratamiento$Regimen, tratamiento$Crecimiento, length)

par.aov <- aov(tratamiento$Regimen~ tratamiento$Crecimiento)
summary(par.aov)

TukeyHSD(par.aov) 

plot(TukeyHSD(par.aov))