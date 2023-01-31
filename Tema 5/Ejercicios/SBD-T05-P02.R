# Ejercicio 1
# Practica los distintos gráficos usando datasets predeterminados de R pero
# distintos a los de los ejemplos del fichero

# Datos de area de los mayores masas de tierras
# Gráfico de puntos con las 15 masas de tierra más pequeñas
df <- sort(datasets::islands, decreasing = FALSE)
head(df)
dotchart(df[1:15])

# Datos de los descubrimientos científicos del 1860 a 1959
# Gráfico de barras de los descubrimientos posteriores a 1950
df <-
  data.frame(
    Discoveries = as.matrix(datasets::discoveries),
    Date = time(datasets::discoveries)
  )
head(df)
barplot(df$Discoveries[df$Date > 1950],
  names.arg = df$Date[df$Date > 1950],
  col = palette(rainbow(3))
)

# Datos de peso y altura de mujeres
# Gráfico en tarta del peso
df <- datasets::women
head(df)
pie(df$height,
  labels = df$height,
  col = palette(rainbow(5))
)

# Datos de distancia de frenado basados en la velocidad
# Gráfico de pares
df <- datasets::cars
head(df)
pairs(df)

# Datos sobre la atenuación de ondas sísmicas respecto a la distancia del
# epicentro
# Gráfico condicional que muestra la varientes de distancia y aceleración en
# base a la magnitud
df <- datasets::attenu
head(df)
coplot(df$dist ~ df$accel | df$mag)

# Datos sobre las muertes por enfermedades de pulmón en Reino Unido entre
# 1974-1979
# Gráfico de histograma del número de muertes
df <- datasets::ldeaths
head.matrix(df)
hist(
  df,
  xlab = "Muertes",
  ylab = "Frecuencia",
  labels = TRUE,
  ylim = c(0, 30)
)


# Ejercicio 2
# Ejercicio libre, usando uno de los dataset libres que puedes encontrar en la
# Junta de Andalucía
# (https://www.juntadeandalucia.es/datosabiertos/portal/dataset) o en el
# gobierno de España (https://datos.gob.es/es)
# Importa el conjunto de datos que más te llame la atención.

# Conjunto de datos para Valores climatológicos normales. Almería Aeropuerto
df <- read.csv(file = "44822.csv", sep = ",", quote = "\"")
colores <- palette(rainbow(12))
head(df)

# Explica que tipo de datos contiene

# El conjunto de datos contiene información acerca de las condiciones
# climatológicas recogidas por la estación del aeropuerto de Almería. La
# información incluye media de precipitaciones, temperatura, humedad
# relativa, dias precipitación, nieve y otras condiciones meteorológicas
# desde 1981 hasta 2010.

# Explica que información podríamos representar.

# Con esta información podríamos representar que meses son más calidos a
# lo largo del año en la provincia, cuales son los meses con más probabilidad
# de lluvia, la media de horas de sol a lo largo del año o por meses, la
# media de dias con nieve o heladas al año o por meses, etc...

# Haz algunos tipos de gráficas con las nuevas funciones, con los datos y
# explica que información quieres representar

# En esta gráfica quiero representar la tempratura media registrada en los
# distintos meses del año
barplot(
  head(df$T, -1),
  names.arg = head(df$Mes, -1),
  ylab = "Temperatura media",
  col = colores,
  ylim = c(0, 30),
  main = "Temperatura media mensual",
  sub = "Meses",
  beside = TRUE
)

# En este gráfico quiero representar como se distribuyen las precipitaciones
# medias a lo largo del año
pie(
  head(df$R, -1),
  labels = paste0(round(100 * head(df$R, -1) / sum(head(
    df$R, -1
  )), 2), "%"),
  col = colores,
  clockwise = TRUE,
  main = "Distribución de lluvias medias por mes"
)
legend("topleft", legend = head(df$Mes, -1), fill = colores)

# En este gráfico quiero representar la relación entre los datos de temperatura
# media máxima y mínima a lo largo de los meses
pairs(
  data.frame(TM = head(df$TM, -1), tm = head(df$Tm, -1)),
  labels = c("Temperatura media máxima", "Temperatura media mínima")
)


# Gráfico bivariado para ver la relación entre las temperaturas máximas y
# mímimas medias para cada mes del año en base a la temperatura media
coplot(
  head(df$TM, -1) ~ head(df$Tm, -1) |
    head(df$T, -1),
  ylab = "Temperatura media máxima",
  xlab = c("Temperatura media mínima", "Temperatura media"),
  col = colores
)
