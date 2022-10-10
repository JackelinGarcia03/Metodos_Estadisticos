# J_Garcia
# 21/09/2022

library(dplyr)

Seg.opcion <- Entrevista1 %>%
  filter(oi_2 == "NO")
Prim.op <- Entrevista1 %>%
  filter(oi_2 == "SI")
fix(Entrevista1)

#remober objetos rm()
rm(oi2.no)
rm(F)
barplot(round(gen/length(Entrevista1$Genero)*100,1),
        ylim = c(0, 100),
        col = "purple"
        xlab = "Genero"
        ylab = "Porcentaje"
        
        