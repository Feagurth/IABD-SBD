# 1.- Al inicio del Capítulo 10 se presentó la base de datos sobre medidas del
# cuerpo, consulte la explicación sobre la base de datos y responda lo
# siguiente.
# Si se asume que la edad tiene distribución normal, ¿cuáles son los
# estimadores de máxima verosimilitud para µ y s?

url <- "https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo"
cuerpos <- read.table(file = url, header = TRUE)

ll <- function(param) {
    media <- param[1] # param es el vector de parámetros
    desvi <- param[2]
    sum(dnorm(x = cuerpos$edad, mean = media, sd = desvi, log = TRUE))
}

minusll <- function(x) -ll(x)


a <- nlminb(
    objective = minusll,
        start = c(range(cuerpos$edad)[2], range(cuerpos$edad)[2]),
        lower = c(range(cuerpos$edad)[1], 1),
        upper = c(range(cuerpos$edad)[2], 10)
)

print(a)

# Como el histograma para la edad muestra un sesgo a la derecha se podría
# pensar que la distribución gamma sería una buena candidata para explicar
# las edades observadas. Asumiendo una distribución gamma, ¿cuáles son los
# estimadores de máxima verosimilitud para los parámetros?




# ¿Cuál de los dos modelos es más apropiado para explicar la variable de
# interés? Calcule el AIC  para decidir.


# 2.- En el capítulo 14 se presentó un ejemplo donde se usó la base de datos
# sobre cangrejos hembra. Consulte la explicación sobre la base de datos y
# responda lo siguiente.
# Suponga que el número de satélites sobre cada hembra es una variable que
# se distribuye Poisson. Construya en R la función de log-verosimilitud l,
# dibuje la función l y encuentre el estimador de máxima verosimilitud de <U+03BB>.


# Repita el ejercicio anterior asumiendo que el número de satélites se
# distribuye binomial negativo.


# ¿Cuál de los dos modelos es más apropiado para explicar la variable de
# interés? Calcule el  AIC para decidir.


# 3.- Al inicio del Capítulo 11 se presentó la base de datos sobre
# apartamentos usados en Medellín, consulte la explicación sobre la base
# de datos y responda lo siguiente.
# Dibuje una densidad para la variable área del apartamento. Describa lo
# encontrado en esa densidad.


# ¿Qué distribuciones de 2 parámetros podrían explicar el comportamiento
# del área de los apartamentos? Mencione al menos 3.


# Para cada una de las distribuciones anteriores dibuje un gráfico de
# contornos o calor para la función de log-verosimilitud y estime los
# parámetros de la distribución elegida.


# ¿Cuál de los dos modelos es más apropiado para explicar la variable de
# interés? Calcule el AIC para decidir.


# 4.- Considere el siguiente modelo de regresión.
# yi ~ Gamma(shapei, scalei)
# log(shapei)=3-7x1
# log(scalei)=3-1x2
# x1~U(0,1)
# x2~Poisson(<U+03BB>=3)
# Simule 100 observaciones del modelo anterior.


# Escriba el vector de parámetros del problema.


# Construya la función minusll para el problema.


# Use la función optim para estimar los parámetros del problema.
