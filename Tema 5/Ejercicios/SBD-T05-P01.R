# Ejercicio 1
# Usando la función plot, genera un gráfico de dispersión haciendo uso del
# dataset airquality.
# 1.- Observa el data set. ¿Que tipo de datos es? ¿Qué variables posee?

aire <- datasets::airquality
str(aire)

print("Disponemos de 5 variables numéricas de tipo entero y 1 decimal")
print("Disponemos de variables para el viento, temperatura, mes, dia,
cantidad de ozono medio y radiación solar")
print("Estos datos se corresponden a mediciones para comprobar la calidad
del aire y la temperatura en una zona específica a lo largo del tiempo")

# 2.- Genera el gráfico de dispersión de la variable Temp respecto a la
# variable Ozone.

plot(aire$Temp, aire$Ozone,
    xlab = "Temperatura",
    ylab = "Media de Ozono"
)

# 3.- Exporta el gráfico como fichero pdf

pdf(file = "Aire_Temperatura_Ozono.pdf")
plot(aire$Temp, aire$Ozone,
    xlab = "Temperatura",
    ylab = "Media de Ozono"
)
dev.off()

# Ejercicio 2
# Usando la función plot y el data set ToothGrowth, genera un diagrama de
# cajas que represente el crecimiento de los dientes en función de la manera
# que recibió la vitamina C.
# 1.- Comprende de que trata dicho conjunto de datos.

dientes <- datasets::ToothGrowth
str(dientes)

print("Disponemos de dos variables numericas y una variable discreta con dos
valores.")
print("Diponemos variables para la longitud del diente, el tipo de suplemento y
la dosis suministrada")
print("Los datos se corresponden con mediciones de longitud dentales respecto
al tipo de suplemento que se la ha suministrado al sujeto")

# 2.- Crea el diagrama de cajas.

plot(dientes$supp, dientes$len,
    xlab = "Tipo Suplemento",
    ylab = "Longitud del Diente"
)

# 3.- Exporta el diagrama en formato JPEG

jpeg(
    filename = "Dientes_Suplemento_Longitud.jpg", quality = 75, bg = "white",
    width = 800, height = 1200,
    antialias = "cleartype"
)
plot(dientes$supp, dientes$len,
    xlab = "Tipo Suplemento",
    ylab = "Longitud del Diente",
)
dev.off()

# Ejercicio 3
# Usando el dataset co2, genera un gráfico de líneas que representa la
# evolución del co2.
# 1.- Comprende de que trata dicho conjunto de datos.

ds_co2 <- datasets::co2
str(ds_co2)

print("Disponemos de dos variables una numérica y otra una serie temporal")
print("Diponemos variables con el valor del CO2 así como del año y el mes
de la medición")

# 2.- Crea el diagrama de líneas.

plot(ds_co2, xlab = "Tiempo", ylab = "CO2")

# 3.- Exporta el diagrama en formato PNG

png(
    filename = "Tiempo_CO2.png", bg = "white",
    width = 800, height = 1200,
    antialias = "cleartype"
)
plot(ds_co2, xlab = "Tiempo", ylab = "CO2")
dev.off()

# Ejercicio 4
# Ejercicio libre, usando uno de los dataset libres que puedes encontrar en la
# Junta de Andalucía
# (https://www.juntadeandalucia.es/datosabiertos/portal/dataset)
# o en el gobierno de España (https://datos.gob.es/es)
# 1.- Importa el conjunto de datos que más te llame la atención.

orozko <- read.csv(
    file = "datos-orozko-2019.csv",
    header = TRUE, sep = ",", dec = ",", quote = "\""
)
str(orozko)

# 2.- Explica que tipo de datos contiene

print("Los datos que contiene se refieren a distintas medidas de
precipitaciones obtenidas a lo largo del tiempo en las estaciones
meteorológicas de Orozko en Bizkaia. ")
print("Disponemos de distintas variables para almacenar el nombre de
la estación así como de la provincia. También disponemos variables
numericas para almacenar las distintas mediciones y la posición de la
estación en el mapa, así como de información con la fecha y hora de las
medidas")

# 3.- Explica que información podríamos representar.

print("Podriamos representar la variación de agua recogida a lo largo del tiempo
o como varía la recogida de lluvia dependiendo de la estación donde se recoja
la información")

# 4.- Haz algunos tipos de gráficas con los datos y explica que información
# quieres representar

print("En este gráfico quiero respresentar como varía la cantidad de agua
recogida a lo largo del tiempo")
plot(as.Date(orozko$DATA.FECHA), orozko$H1,
    xlab = "Fecha", ylab = "Agua recogida"
)

print("En este gráfico quiero respresentar como varía porcentaje de recogida
total a lo largo del tiempo")
plot(
    as.Date(orozko$DATA.FECHA),
    orozko$Q * 10, xlab = "Fecha", ylab = "% recogida"
)
