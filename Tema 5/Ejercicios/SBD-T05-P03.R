# Ejercicio 1
# Haciendo uso del data set mtcars:

# Cargamos el dataset en un dataframe
cars <- datasets::mtcars

# Dibuja un gráfico de barras que represente la cantidad de vehículos que hay
# para los distintos valores de la variable mtcars$cyl.

barplot(table(mtcars$cyl))

# Establece un color para cada una de las barras.

barplot(table(mtcars$cyl), col = palette(rainbow(4)))

# Añade al gráfico un título y un subtítulo.

barplot(table(mtcars$cyl),
  col = palette(rainbow(4)),
  main = "Cantidad de Coches x Cilindros",
  sub = "Marcas extranjeras",
  xlab = "Nº de Cilindros",
  ylab = "Número de coches",
  ylim = c(0, 18)
)

# Ejercicio 2
# Haciendo uso de los datasets mdeaths, ldeaths y fdeaths, realiza un gráfico
# donde:

# Los 3 conjuntos de datos deben quedar representados como un gráfico de líneas.

plot(fdeaths,
  col = "blue",
  ylim = c(200, 4000)
)
lines(mdeaths, col = "red")
lines(ldeaths, col = "green")

# El eje y debe quedar limitado al máximo y el mínimo de los valores.

plot(fdeaths,
  col = "blue",
  ylim = c(
    min(fdeaths, mdeaths, ldeaths),
    max(fdeaths, mdeaths, ldeaths)
  )
)
lines(mdeaths, col = "red")
lines(ldeaths, col = "green")

# Las líneas de mdeaths serán continuas mientras que la de ldeaths y fdeaths
# serán discontinuas.

plot(fdeaths,
  col = "blue",
  type = "l",
  lty = 2,
  ylim = c(
    min(fdeaths, mdeaths, ldeaths),
    max(fdeaths, mdeaths, ldeaths)
  )
)
lines(mdeaths, col = "red", type = "l", lty = 1)
lines(ldeaths, col = "green", type = "l", lty = 3)


# Las líneas de fdeaths deben ser más anchas que las otras dos.

plot(fdeaths,
  col = "blue",
  type = "l",
  lty = 2,
  lwd = 3,
  ylim = c(
    min(fdeaths, mdeaths, ldeaths),
    max(fdeaths, mdeaths, ldeaths)
  )
)
lines(mdeaths, col = "red", type = "l", lty = 1)
lines(ldeaths, col = "green", type = "l", lty = 3)

# Las tres líneas deben tener colores distintos, quedando claro cual es cada una
# en una leyenda.

plot(fdeaths,
  col = "blue",
  type = "l",
  lty = 2,
  lwd = 3,
  ylim = c(
    min(fdeaths, mdeaths, ldeaths),
    max(fdeaths, mdeaths, ldeaths)
  )
)
lines(mdeaths, col = "red", type = "l", lty = 1)
lines(ldeaths, col = "green", type = "l", lty = 3)
legend(
  x = "topright",
  legend = c("fdeaths", "mdeaths", "ldeaths"),
  col = c("blue", "red", "green"),
  lty = 1:1
)

# Por último, cambia el nombre a los ejes x e y.

plot(fdeaths,
  col = "blue",
  type = "l",
  lty = 2,
  lwd = 3,
  xlab = "Años",
  ylab = "Nº de muertes",
  ylim = c(
    min(fdeaths, mdeaths, ldeaths),
    max(fdeaths, mdeaths, ldeaths)
  )
)
lines(mdeaths, col = "red", type = "l", lty = 1)
lines(ldeaths, col = "green", type = "l", lty = 3)
legend(
  x = "topright",
  legend = c("fdeaths", "mdeaths", "ldeaths"),
  col = c("blue", "red", "green"),
  lty = c(2, 1, 3)
)

# Ejercicio 3
# Haciendo uso del dataset precip:

dt <- datasets::precip

# Filtra el dataset quedándote únicamente con los primeros 5 valores.

dt_5 <- dt[1:5]

# Crea un gráfico donde aparezca el nombre de cada ciudad en lugar del valor.

barplot(dt_5)

# Dibuja aquellos nombres cuyo valor sea menor a 20 de color rojo y en cursiva.

barplot(
  subset(
    x = dt_5,
    subset = dt_5 < 20
  ),
  col = "red",
  font = 3
)

# Dibuja aquellos nombres cuyo valor sea mayor a 20 de color azul y en negrita.

barplot(
  subset(
    x = dt_5,
    subset = dt_5 > 20
  ),
  col = "blue",
  font = 2
)

barplot(
  dt_5,
  ylim = c(0, max(dt_5) + 10),
  col = ifelse(dt_5 < 20, "red", ifelse(dt_5 > 20, "blue", "grey")),
  font = 2
)


# Ejercicio 4
# Modifica los gráficos realizados en ejercicio 4  de la tarea presencial del
# 23/01/2023 con lo aprendido hoy

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

df <- datasets::women
head(df)
pie(df$height,
  labels = df$height,
  col = palette(rainbow(5))
)

df <- datasets::cars
head(df)
pairs(df)


df <- datasets::attenu
head(df)
coplot(df$dist ~ df$accel | df$mag)


df <- datasets::ldeaths
head.matrix(df)
hist(
  df,
  xlab = "Muertes",
  ylab = "Frecuencia",
  labels = TRUE,
  ylim = c(0, 30)
)


df <- read.csv(file = "44822.csv", sep = ",", quote = "\"")
colores <- palette(rainbow(12))
head(df)


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
