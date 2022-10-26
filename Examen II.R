# Examen II
# 26/10/2022
# J_Garcia

insecticida 

data(InsectSprays)
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, mean)
tapply(InsectSprays$count, InsectSprays$spray, median)
tapply(InsectSprays$count, InsectSprays$spray, sd)
tapply(InsectSprays$count, InsectSprays$spray, var)
tapply(InsectSprays$count, InsectSprays$spray, length)

boxplot(InsectSprays$count ~ InsectSprays$spray)
insecticida <- shapiro.test
"shapiro.test" (InsectSprays$count)

bartlett.test(InsectSprays$count, InsectSprays$spray)
par.aov <- aov(InsectSprays$count ~ InsectSprays$spray)
summary(par.aov)
TukeyHSD(par.aov) 
plot(TukeyHSD(par.aov))




