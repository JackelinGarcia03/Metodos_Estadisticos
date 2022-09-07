# J_Garcia
# 31/08/2022
# Encuesta

# Convertir variable a factor

Entrevista <- read.csv("Datos/Encuesta_codificada.csv", header = T)
Entrevista$Entrev <- as.factor(Entrevista$Entrev)
Entrevista$oi_2a <- as.factor(Entrevista$oi_2a)
Entrevista$oi_4a <- as.factor(Entrevista$oi_4a)
levels(Entrevista$Entrev)  

#Revisar si son factores
Entrevista$Genero <- as.factor(Entrevista$Genero)
levels(Entrevista$Genero)
Entrevista$Carrera <- as.factor(Entrevista$Carrera)
levels(Entrevista$Carrera)
Entrevista$Semestre <- as.factor(Entrevista$Semestre)
levels(Entrevista$Semestre)

#Función para transformar caracteres en fechas
Entrevista$Fecha <- as.Date(Entrevista$Fecha, "%d/%m/%y")
library(lubridate)
Entrevista$Fecha <- as.Date(Entrevista$Fecha)

#Queda pendeinte---- Entrevista$Fecha <- as.Date(Entrevista$Fecha, format()

#¿Cual fue el porcentaje de entrevistados por genéro?
gen <- table(Entrevista$Genero)
round(gen/length(Entrevista$Genero)*100,1)                            

#¿Que equipo entrevistador tuvo mas encuestas?
ent <- table(Entrevista$Entrev)
prop.table(ent)*100
pie(prop.table(ent)*100)

#¿Cual es el procentaje de alumnos entrevistados por carrera?
table(Entrevista$Carrera)
car <- table(Entrevista$Carrera)
prop.table(car)*100

#¿Cuantos alumnos participaron por semestre?
sem <- table(Entrevista$Semestre)
prop.table(sem)*100
                  
#¿Cual es el rango de edad de los participantes?
range(Entrevista$Edad)

#¿Como te enteraste de la facultad?
conFCF <- table(Entrevista$oi_1)
conFCF
prop.table(conFCF)*100
pie(prop.table(conFCF)*100)

  #¿Fué tu primera opcion la FCF?
op <- table(Entrevista$oi_2)
prop.table(op)*100

#¿Presentaste en otra facultad?
of <- table(Entrevista$oi_2a)
prop.table(of)*100
