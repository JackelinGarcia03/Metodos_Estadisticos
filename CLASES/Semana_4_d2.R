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
Entrevista$oi_4a <- as.factor(Entrevista$oi_4a)

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

# ¿Cuantos alumnos participaron por semestre?
sem <- table(Entrevista$Semestre)
prop.table(sem)*100
                  
# ¿Cual es el rango de edad de los participantes?
range(Entrevista$Edad)

# ¿Como te enteraste de la facultad?
conFCF <- table(Entrevista$oi_1)
conFCF
prop.table(conFCF)*100
pie(prop.table(conFCF)*100

#¿Fué tu primera opcion la FCF?
op <- table(Entrevista$oi_2)
prop.table(op)*100

#¿Presentaste en otra facultad?
of <- table(Entrevista$oi_2a)
prop.table(of)*100

# Estuviste inscrito en otra facultad
oi_4 <- table(Entrevista$oi_4)
oi_4 
prop.table(oi_4)*100

# ¿Donde estabas incrito?
oi_4a <- table(Entrevista$oi_4a)
oi_4a
prop.table(oi_4a)*100

# Convivencia 
ef_1 <- table(Entrevista$ef_1)
ef_1
prop.table(ef_1)*100

# Instalaciones de la facultad
ins_1 <- table(Entrevista$ins_1)
ins_1
prop.table(ins_1)*100

# Conocen su malla curricular
ap_1 <- table(Entrevista$ap_1)
ap_1
prop.table(ap_1)*100

# Tareas a tiempo
ap_2 <- table(Entrevista$ap_2)
ap_2
prop.table(ap_2)*100

# Atención en las clases
ap_3 <- table(Entrevista$ap_3)
ap_3
prop.table(ap_3)*100

# Guardar la BD con los datos nuevos en formato csv
write.csv(Entrevista, "Encuesta_codificada.csv")

