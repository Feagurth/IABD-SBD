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
       max(fdeaths, mdeaths, ldeaths))
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
       max(fdeaths, mdeaths, ldeaths))
)
lines(mdeaths, col = "red", type ="l", lty= 1)
lines(ldeaths, col = "green", type = "l", lty = 3)


# Las líneas de fdeaths deben ser más anchas que las otras dos.

plot(fdeaths,  
     col = "blue", 
     type = "l",
     lty = 2,
     lwd = 3,
     ylim = c(
       min(fdeaths, mdeaths, ldeaths), 
       max(fdeaths, mdeaths, ldeaths))
)
lines(mdeaths, col = "red", type ="l", lty= 1)
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
       max(fdeaths, mdeaths, ldeaths))
)
lines(mdeaths, col = "red", type ="l", lty= 1)
lines(ldeaths, col = "green", type = "l", lty = 3)
legend(1977.9, 4000, 
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
       max(fdeaths, mdeaths, ldeaths))
)
lines(mdeaths, col = "red", type ="l", lty= 1)
lines(ldeaths, col = "green", type = "l", lty = 3)
legend(1977.9, 4000, 
       legend = c("fdeaths", "mdeaths", "ldeaths"), 
       col = c("blue", "red", "green"), 
       lty = 1:1
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
    subset = dt_5 < 20), 
  col = "red", 
  font=3
)

# Dibuja aquellos nombres cuyo valor sea mayor a 20 de color azul y en negrita.


barplot(
  subset(
    x = dt_5, 
    subset = dt_5 > 20), 
  col = "blue", 
  font=2
)


# Ejercicio 4
# Modifica los gráficos realizados en ejercicio 4  de la tarea presencial del 23/01/2023 
# con lo aprendido hoy

