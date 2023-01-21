# Use funciones o procedimientos (varias líneas) de R para responder cada una
# de las siguientes preguntas.
# 1.- Para cada uno de los estratos socioeconómicos, calcular el coeficiente de
# correlación lineal de Pearson para las variables precio y área de la base de
# datos de los apartamentos usados.
library(dplyr)
library("corrplot")

url <- "https://raw.githubusercontent.com/fhernanb/datos/master/aptos2015"
datos <- read.table(file = url, header = TRUE)

print(datos %>%
    group_by(estrato) %>%
    summarise(correlacion = cor(x = precio, y = mt2, method = "pearson")))

# 2.- Calcular los coeficientes de correlación Pearson, Kendall y Spearman para
# las variables cuantitativas de la base de datos sobre medidas del cuerpo
# explicada en el Capítulo 10. La url con la información es la siguiente:
# https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo

url <- "https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo"
cuerpos <- read.table(file = url, header = TRUE)

cuerpos_cuanti <- cuerpos[, c(1, 2, 3, 5, 6)]
colnames(cuerpos_cuanti) <- c("edad", "peso", "altura", "muneca", "biceps")

print("Correlacion Pearson, para las variables cuantitativas de medidas
corporales")
corr_pearson <- round(cor(cuerpos_cuanti, method = "pearson"), digits = 2)
print(corr_pearson)
print("")

print("Correlacion Kendall, para las variables cuantitativas de medidas
corporales")
corr_kendall <- round(cor(cuerpos_cuanti, method = "kendall"), digits = 2)
print(corr_kendall)
print("")

print("Correlacion Spearman, para las variables cuantitativas de medidas
corporales")
corr_spearman <- round(cor(cuerpos_cuanti, method = "spearman"), digits = 2)
print(corr_spearman)
print("")

# 3.- Represente gráficamente las matrices de correlación obtenidas en el
# ejercicio anterior.

corrplot.mixed(corr_pearson)

corrplot.mixed(corr_kendall)

corrplot.mixed(corr_spearman)
