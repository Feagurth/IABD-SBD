# Para la base de datos medidas del cuerpo presentada en el Capítulo 10,
# explorar si la variable estatura, diferenciada por hombres y mujeres,
# tiene una distribución normal.

# Leemos los datos
url <- "https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo"
datos <- read.table(file = url, header = TRUE)

# Separamos los datos haciendo uso de split
alturas <- split(datos$altura, datos$sexo)

# Mostramos el gráfico de densidades de alturas de hombres y mujeres
plot(density(alturas$Hombre),
      lwd = 3, col = "blue",
      xlim = c(130, 210), main = "", las = 1,
      xlab = "Altura (cms)", ylab = "Densidad"
)
lines(density(alturas$Mujer), lwd = 3, col = "deeppink")
legend("topleft",
      legend = c("Hombres", "Mujeres"),
      lwd = 3, col = c("blue", "deeppink"), bty = "n"
)

print("La gráficas mostradas no son completamente simétricas por lo que no se
      puede asegurar que los datos mostrados provengan de una distribución
      normal, si bien tampoco se puede descargar al ser muy parecidas")

# Dibujamos los graficos cuantil cuantil de las alturas de hombres y
# mujeres
par(mfrow = c(1, 2))
qqnorm(alturas$Hombre, main = "Alturas hombres")
qqline(alturas$Hombre)

qqnorm(alturas$Mujer, main = "Alturas mujeres")
qqline(alturas$Mujer)

print("Si calculamos los gráficos cuantil cuantil de los datos de altura
      para los hombres observamos que los puntos no se encuentran muy
      alineados respecto a lina de referencia")

print("Lo mismo ocurre con el gráfico cuantil cuantil de los datos de altura
      para las mujeres, estando este último más alineado con la linea de
      referencia")

print("De este analisis no podemos asegurar que los datos no provengan de una
      distribución normal, pero tampoco podemos asegurarlo")

# Dibujamos las graficas QQPlot de las alturas de hombres y mujeres
require(car)

qqPlot(
      alturas$Hombre,
      pch = 20, ylab = "Altura (cms)", main = "QQplot para altura de hombres"
)
qqPlot(
      alturas$Mujer,
      pch = 20, ylab = "Altura (cms)", main = "QQplot para altura de mujeres"
)

print("Gracias a la generación de los gráficos QQPlot podemos afirmar que, al
      encontrarse todos los valores de la altura de las mujeres dentro de sus
      respectivas bandas, los datos de altura de las mujeres provienen de una
      distribución normal")

print("En el caso de los hombre la mayoría de los valores se encuentran también
      dentro de las bandas, pero hay algunos que no lo están por lo que no
      podemos estar seguros, si bien podrían ser valores outliners")

# Realizamos distintas pruebas de normalidad a los datos para comprobar su
# normalidad
# Prueba Shapiro-Wilk
lapply(alturas, shapiro.test)

# Prueba Anderson-Darling
require(nortest)
lapply(alturas, ad.test)

# Prueba Cramer-von Mises
lapply(alturas, cvm.test)

# Prueba Lilliefors (Kolmogorov-Smirnov)
lapply(alturas, lillie.test)

# Prueba Pearson chi-square
lapply(alturas, pearson.test)

# Prueba Shapiro-Francia
lapply(alturas, sf.test)

print("Puesto que en todas las pruebas el resultado de p-value ha sido 
      superior a 0.05 no se puede descartar la hipótesis de que los datos
      provengan de una distribución normal")