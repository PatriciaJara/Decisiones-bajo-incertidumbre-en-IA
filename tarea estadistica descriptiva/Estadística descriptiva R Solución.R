#Decisiones bajo incertidumbre en las organizaciones

#Análisis de datos para la toma de una decisión

#Paso 1: Importar y cargar las librerías requeridas

install.packages("e1071")
library(e1071)

#Paso 2: Lectura de datos

#Lea los datos del archivo "Supermarket transactions.xlsx" y asígnelos a un objeto
#cuyo nombre sea "datos"

#Sugerencia: Guarde el archivo como csv (punto decimal con . y separador de campos con ,)
#y use la función read.csv. Asegúrese de remover el signo $ de la columna Revenue y de
#escribir el argumento header=TRUE para que R reconozca los encabezados del archivo.

datos=read.csv(file.choose(),sep=",",header=TRUE)

#Use la función class para ver qué tipo de objeto es "datos"

class(datos)

#Paso 3: Cálculo de la estadística básica de las variables cuantitativas del dataframe

#Use la función sapply(datos, mean, na.rm=TRUE) para calcular la media de las tres variables
#cuantitativas del dataframe. ¿Cuáles son esas tres variables?

sapply(datos, mean, na.rm=TRUE)

#Cree un vector para cada una de las tres variables cuantitativas del data frame, y asigne en
#cada vector la columna asociada a cada variable.

Children=datos$Children
Units.Sold=datos$Units.Sold
Revenue=datos$Revenue

#Use las funciones sd() y var() para calcular la desviación estándar y la varianza de cada una
#de las tres variables cuantitativas.

#Use la función summary(vectordedatos) (reemplace vectordedatos por
#Units.Sold, Children y Revenue) para ver otra forma de calcular estadísticos
#descriptivos del dataframe. ¿Qué estadísticos adicionales produce la función
#summary?

summary(Children)
summary(Units.Sold)
summary(Revenue)

#Calcule el percentil 5 y 95 de los vectores con los datos de Units.Sold, Children y Revenue.

#Use la función quantile(datos$Variable,c(vector con valores de percentiles)) para calcular
#los percentiles pedidos (0.05 y 0.95). Reemplace Variable por Units.Sold, Children y Revenue.
#¿Cómo se interpretan los valores obtenidos?

quantile(datos$Units.Sold,c(0.05,0.95))
quantile(datos$Children,c(0.05,0.95))
quantile(datos$Revenue,c(0.05,0.95))

#Calcule la mediana de los vectores con los datos de Units.Sold, Children y Revenue

#Use la función median(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular la mediana de dichas variables cuantitativas.
#¿Cuál es la interpretación del valor resultante?

median(datos$Units.Sold,na.rm=TRUE)
median(datos$Children,na.rm=TRUE)
median(datos$Revenue,na.rm=TRUE)

#Calcule el sesgo (tercer momento) de las variables Units.Sold, Children y Revenue

#Use la función skewness(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular el sesgo de dichas variables cuantitativas.
#¿Cuál es la interpretación del valor resultante?

skewness(datos$Units.Sold,na.rm=TRUE)
skewness(datos$Children,na.rm=TRUE)
skewness(datos$Revenue,na.rm=TRUE)
#Calcule la curtosis (cuarto momento) de las variables Units.Sold, Children y Revenue

#Use la función kurtosis(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular la curtosis de dichas variables cuantitativas.
#¿Cuál es la interpretación del valor resultante?

kurtosis(datos$Units.Sold,na.rm=TRUE)
kurtosis(datos$Children,na.rm=TRUE)
kurtosis(datos$Revenue,na.rm=TRUE)

#Cree un dataframe A que tenga las columnas Units.Sold, Children y Revenue del objeto datos

A=data.frame(datos$Units.Sold,datos$Children,datos$Revenue)

#Calcule la matriz de correlaciones entre las variables Units.Sold, Children y Revenue

#Use la función cor(), donde el argumento de la función es el dataframe que creó con
#las columnas Units.Sold,Children y Revenue

cor(A)

#Paso 4: Visualización

#Cree un histograma para la variable Revenue

#Use la función hist(Variable) para crear el histograma. Explore los argumentos de la
#función para asignarle algún color de relleno al histograma.

hist(datos$Revenue,col=3)

#Cree un histograma para revenue según el sexo de los clientes (un histograma por
#cada sexo). Note que debe extraer por separado los datos de Revenue para los cuales
#el sexo es masculino y femenino.

par(mfrow=c(1,2))
hist(datos[datos$Gender =="M",]$Revenue)
hist(datos[datos$Gender =="F",]$Revenue)

#Cree un diagrama de dispersión con las variables Revenue y Children. Use la función
#plot. En esta función, el primer argumento los los datos del eje horizontal y el segundo
#argmento son los datos del eje vertical.

plot(datos$Revenue,datos$Units.Sold)

#Cree un gráfico boxplot para Revenue. Use la función boxplot() donde el argumento
#es el conjunto de datos al que se le hará el boxplot.

boxplot(datos$Revenue)

#Cuente la cantidad de registros que se presentaron en cada ciudad. Esto significa
#contar la cantidad de ocurrencias de cada elemento de la columna City.

#Use la función table() donde el argumento es el conjunto de datos en los que 
#va a contar la cantidad de ocurrencias de cada elemento.

table(datos$City)

#Haga un gráfico de la cantidad de registros que se presentaron en cada ciudad.

#Sugerencia: asigne los resultados del punto anterior a un objeto, y use la función plot
#para graficar ese objeto.

plot(table(datos$City))

#Haga un gráfico de torta de la participación de cada país (Country)
#en el total de los registros.

#Sugerencia: cuente primero la cantidad de registros para cada Country y luego
#use la función pie() para generar el gráfico de torta.

pie(table(datos$Country))

#¿Qué debe entregar? Este código R y un documento en formato pdf en el que muestre las tablas
#y gráficas obtenidas, junto con la interpretación de los resultados que considere más relevantes.