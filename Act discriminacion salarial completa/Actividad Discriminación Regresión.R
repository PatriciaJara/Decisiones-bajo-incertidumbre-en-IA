#Decisiones bajo incertidumbre en las organizaciones

#Actividad: Análisis de regresión para verificar si hay discriminación por género

#Lectura de datos

datos=read.csv(file.choose(),sep=",",header=T)

#Nombramiento de las varibles

y=datos$Salario.anual
x1=datos$genero
x2=datos$Experiencia.previa
x3=datos$experiencia.en.la.empresa
x4=datos$Nivel.educativo

#Regresion de salario vs género

r1=lm(y~x1)

summary(r1)

#Regresión de salario vs genero y experiencia previa y actual

r2=lm(y~x1+x2+x3)

#Expresamos x4 como una variable categorica

x4=as.factor(x4)

#Regresion de salario vs genero, experiencia previa, experiencia actual y nivel educativo

r3=lm(y~x1+x2+x3+x4)

summary(r3)

#Otra manera de expresar X4 como variable categórica, poniendo el nivel 2 como referencia

#x4=factor(x4,levels=c(2,1,3:5))

