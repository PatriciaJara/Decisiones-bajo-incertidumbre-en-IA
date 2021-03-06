#Decisiones bajo incertidumbre en las organizaciones

#An�lisis de datos para la toma de una decisi�n

#Paso 1: Importar y cargar las librer�as requeridas

install.packages("e1071")
library(e1071)

#Paso 2: Lectura de datos

#Lea los datos del archivo "Supermarket transactions.xlsx" y as�gnelos a un objeto
#cuyo nombre sea "datos"

#Sugerencia: Guarde el archivo como csv (punto decimal con . y separador de campos con ,)
#y use la funci�n read.csv. Aseg�rese de remover el signo $ de la columna Revenue y de
#escribir el argumento header=TRUE para que R reconozca los encabezados del archivo.

datos=read.csv(file.choose(),sep=",",header=TRUE)

#Use la funci�n class para ver qu� tipo de objeto es "datos"

class(datos)

#Paso 3: C�lculo de la estad�stica b�sica de las variables cuantitativas del dataframe

#Use la funci�n sapply(datos, mean, na.rm=TRUE) para calcular la media de las tres variables
#cuantitativas del dataframe. �Cu�les son esas tres variables?

sapply(datos, mean, na.rm=TRUE)

#Cree un vector para cada una de las tres variables cuantitativas del data frame, y asigne en
#cada vector la columna asociada a cada variable.

Children=datos$Children
Units.Sold=datos$Units.Sold
Revenue=datos$Revenue

#Use las funciones sd() y var() para calcular la desviaci�n est�ndar y la varianza de cada una
#de las tres variables cuantitativas.

#Use la funci�n summary(vectordedatos) (reemplace vectordedatos por
#Units.Sold, Children y Revenue) para ver otra forma de calcular estad�sticos
#descriptivos del dataframe. �Qu� estad�sticos adicionales produce la funci�n
#summary?

summary(Children)
summary(Units.Sold)
summary(Revenue)

#Calcule el percentil 5 y 95 de los vectores con los datos de Units.Sold, Children y Revenue.

#Use la funci�n quantile(datos$Variable,c(vector con valores de percentiles)) para calcular
#los percentiles pedidos (0.05 y 0.95). Reemplace Variable por Units.Sold, Children y Revenue.
#�C�mo se interpretan los valores obtenidos?

quantile(datos$Units.Sold,c(0.05,0.95))
quantile(datos$Children,c(0.05,0.95))
quantile(datos$Revenue,c(0.05,0.95))

#Calcule la mediana de los vectores con los datos de Units.Sold, Children y Revenue

#Use la funci�n median(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular la mediana de dichas variables cuantitativas.
#�Cu�l es la interpretaci�n del valor resultante?

median(datos$Units.Sold,na.rm=TRUE)
median(datos$Children,na.rm=TRUE)
median(datos$Revenue,na.rm=TRUE)

#Calcule el sesgo (tercer momento) de las variables Units.Sold, Children y Revenue

#Use la funci�n skewness(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular el sesgo de dichas variables cuantitativas.
#�Cu�l es la interpretaci�n del valor resultante?

skewness(datos$Units.Sold,na.rm=TRUE)
skewness(datos$Children,na.rm=TRUE)
skewness(datos$Revenue,na.rm=TRUE)
#Calcule la curtosis (cuarto momento) de las variables Units.Sold, Children y Revenue

#Use la funci�n kurtosis(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular la curtosis de dichas variables cuantitativas.
#�Cu�l es la interpretaci�n del valor resultante?

kurtosis(datos$Units.Sold,na.rm=TRUE)
kurtosis(datos$Children,na.rm=TRUE)
kurtosis(datos$Revenue,na.rm=TRUE)

#Cree un dataframe A que tenga las columnas Units.Sold, Children y Revenue del objeto datos

A=data.frame(datos$Units.Sold,datos$Children,datos$Revenue)

#Calcule la matriz de correlaciones entre las variables Units.Sold, Children y Revenue

#Use la funci�n cor(), donde el argumento de la funci�n es el dataframe que cre� con
#las columnas Units.Sold,Children y Revenue

cor(A)

#Paso 4: Visualizaci�n

#Cree un histograma para la variable Revenue

#Use la funci�n hist(Variable) para crear el histograma. Explore los argumentos de la
#funci�n para asignarle alg�n color de relleno al histograma.

hist(datos$Revenue,col=3)

#Cree un histograma para revenue seg�n el sexo de los clientes (un histograma por
#cada sexo). Note que debe extraer por separado los datos de Revenue para los cuales
#el sexo es masculino y femenino.

par(mfrow=c(1,2))
hist(datos[datos$Gender =="M",]$Revenue)
hist(datos[datos$Gender =="F",]$Revenue)

#Cree un diagrama de dispersi�n con las variables Revenue y Children. Use la funci�n
#plot. En esta funci�n, el primer argumento los los datos del eje horizontal y el segundo
#argmento son los datos del eje vertical.

plot(datos$Revenue,datos$Units.Sold)

#Cree un gr�fico boxplot para Revenue. Use la funci�n boxplot() donde el argumento
#es el conjunto de datos al que se le har� el boxplot.

boxplot(datos$Revenue)

#Cuente la cantidad de registros que se presentaron en cada ciudad. Esto significa
#contar la cantidad de ocurrencias de cada elemento de la columna City.

#Use la funci�n table() donde el argumento es el conjunto de datos en los que 
#va a contar la cantidad de ocurrencias de cada elemento.

table(datos$City)

#Haga un gr�fico de la cantidad de registros que se presentaron en cada ciudad.

#Sugerencia: asigne los resultados del punto anterior a un objeto, y use la funci�n plot
#para graficar ese objeto.

plot(table(datos$City))

#Haga un gr�fico de torta de la participaci�n de cada pa�s (Country)
#en el total de los registros.

#Sugerencia: cuente primero la cantidad de registros para cada Country y luego
#use la funci�n pie() para generar el gr�fico de torta.

pie(table(datos$Country))

#�Qu� debe entregar? Este c�digo R y un documento en formato pdf en el que muestre las tablas
#y gr�ficas obtenidas, junto con la interpretaci�n de los resultados que considere m�s relevantes.