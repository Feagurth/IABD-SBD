# 1.- Al inicio del Capítulo 10 se presentó la base de datos sobre medidas del
# cuerpo, consulte la explicación sobre la base de datos y responda lo
# siguiente.
# Si se asume que la edad tiene distribución normal, ¿cuáles son los
# estimadores de máxima verosimilitud para µ y s?
url <- "https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo"
cuerpos <- read.table(file = url, header = TRUE)

require(MASS)
fit1 <- fitdistr(x = cuerpos$edad, densfun = "normal")
print(fit1)

# Como el histograma para la edad muestra un sesgo a la derecha se podría
# pensar que la distribución gamma sería una buena candidata para explicar
# las edades observadas. Asumiendo una distribución gamma, ¿cuáles son los
# estimadores de máxima verosimilitud para los parámetros?

fit2 <- fitdistr(x = cuerpos$edad, densfun = "gamma")
print(fit2)

# ¿Cuál de los dos modelos es más apropiado para explicar la variable de
# interés? Calcule el AIC  para decidir.

aic_fit1 <- -2 * logLik(fit1) + 2 * 2
aic_fit2 <- -2 * logLik(fit2) + 2 * 2

if (aic_fit1[1] < aic_fit2[1]) {
    print(paste(
        "El mejor modelo es el de distribucción normal con una puntuación de",
        aic_fit1[1],
        "respecto la puntuación de ",
        aic_fit2[1],
        "del modelo de distribucción normal"
    ))
} else {
    print(paste(
        "El mejor modelo es el de distribucción gamma con una puntuación de",
        aic_fit2[1],
        "respecto la puntuación de ",
        aic_fit1[1],
        "del modelo de distribucción normal"
    ))
}

# 2.- En el capítulo 14 se presentó un ejemplo donde se usó la base de datos
# sobre cangrejos hembra. Consulte la explicación sobre la base de datos y
# responda lo siguiente.
# Suponga que el número de satélites sobre cada hembra es una variable que
# se distribuye Poisson. Construya en R la función de log-verosimilitud l,
# dibuje la función l y encuentre el estimador de máxima verosimilitud de <U+03BB>.


url <- "https://raw.githubusercontent.com/fhernanb/datos/master/crab"
cangrejos <- read.table(file = url, header = TRUE)

ll1 <- function(lambda) {
    sum(dpois(
        x = cangrejos$Sa, lambda = lambda,
        log = TRUE
    ))
}

ll1 <- Vectorize(ll1)

curve(ll1,
    lwd = 4, col = "dodgerblue3",
    xlab = "<U+03BB>", las = 1,
    ylab = "l(<U+03BB>)"
)

grid()

fit3 <- fitdistr(x = cangrejos$Sa, densfun = "poisson")
print(fit3)

# Repita el ejercicio anterior asumiendo que el número de satélites se
# distribuye binomial negativo.

ll1 <- function(valor) {
    sum(dnbinom(
        x = cangrejos$Sa, size = length(cangrejos$Sa), prob = valor,
        log = TRUE
    ))
}

ll1 <- Vectorize(ll1)

curve(ll1,
    lwd = 4, col = "dodgerblue3",
    xlab = "x", las = 1,
    ylab = "F(x)"
)

grid()

fit4 <- fitdistr(
    x = cangrejos$Sa, densfun = "negative binomial",
    lower = c(0, 0)
)

print(fit4)

# ¿Cuál de los dos modelos es más apropiado para explicar la variable de
# interés? Calcule el  AIC para decidir.

aic_fit3 <- -2 * logLik(fit3) + 2 * 2
aic_fit4 <- -2 * logLik(fit4) + 2 * 2

if (aic_fit3[1] < aic_fit4[1]) {
    print(paste(
        "El mejor modelo es el de distribucción Poisson con una puntuación de",
        aic_fit3[1],
        "respecto la puntuación de ",
        aic_fit4[1],
        "del modelo de binomial negativo"
    ))
} else {
    print(paste(
        "El mejor modelo es el binomial negativo con una puntuación de",
        aic_fit4[1],
        "respecto la puntuación de ",
        aic_fit3[1],
        "del modelo de distribucción Poisson"
    ))
}

# 3.- Al inicio del Capítulo 11 se presentó la base de datos sobre
# apartamentos usados en Medellín, consulte la explicación sobre la base
# de datos y responda lo siguiente.
# Dibuje una densidad para la variable área del apartamento. Describa lo
# encontrado en esa densidad.

url <- "https://raw.githubusercontent.com/fhernanb/datos/master/aptos2015"
apartamentos <- read.table(file = url, header = TRUE)

plot(density(apartamentos$mt2),
    lwd = 3, col = "blue",
    xlim = range(apartamentos$mt2), main = "", las = 1,
    xlab = "Mt2", ylab = "Densidad"
)

print("Según el gráfico se puede observar que hay una mayor cantidad de pisos
que tienen una media de 100 metros cuadrados")

# ¿Qué distribuciones de 2 parámetros podrían explicar el comportamiento
# del área de los apartamentos? Mencione al menos 3.

apartamentos_tmp <- apartamentos
apartamentos_tmp$ubicacion <- sapply(
    as.factor(apartamentos_tmp$ubicacion),
    unclass
)
apartamentos_tmp$balcon <- sapply(
    as.factor(apartamentos_tmp$balcon),
    unclass
)
apartamentos_tmp$parqueadero <- sapply(
    as.factor(apartamentos_tmp$parqueadero),
    unclass
)
apartamentos_tmp$terminado <- sapply(
    as.factor(apartamentos_tmp$terminado),
    unclass
)
print(cor(apartamentos_tmp, method = "spearman"))

print("A partir de la inspección de las correlaciones de los datos se
puede deducir que las variables más importantes para evaluar el precio
de la vivienda son los metros cuadrados de la misma, el valor del mismo
en la escritura y el estrato o  nivel socieconomico donde está el apartamento")

# Para cada una de las distribuciones anteriores dibuje un gráfico de
# contornos o calor para la función de log-verosimilitud y estime los
# parámetros de la distribución elegida.

# Cargar la librería MASS
library(MASS)

# Dibujar un gráfico de contornos para la función de log-verosimilitud
# de la distribución normal de metros cuadrados de los  apartamentos
fit1 <- fitdistr(x = apartamentos$mt2, densfun = "normal")

qqplot(
    y = apartamentos$mt2, pch = 19,
    x = qnorm(ppoints(apartamentos$mt2),
        mean = fit1$estimate[1],
        sd = fit1$estimate[2]
    )
)

# Dibujar un gráfico de contornos para la función de log-verosimilitud
# de la distribución normal del valor en escritura de los apartamentos
fit2 <- fitdistr(x = apartamentos$avaluo, densfun = "normal")

qqplot(
    y = apartamentos$avaluo, pch = 19,
    x = qnorm(ppoints(apartamentos$avaluo),
        mean = fit2$estimate[1],
        sd = fit2$estimate[2]
    )
)

# Dibujar un gráfico de contornos para la función de log-verosimilitud
# de la distribución normal estrato socioeconomico de los apartamentos
fit3 <- fitdistr(x = apartamentos$estrato, densfun = "normal")

qqplot(
    y = apartamentos$estrato, pch = 19,
    x = qnorm(ppoints(apartamentos$estrato),
        mean = fit3$estimate[1],
        sd = fit3$estimate[2]
    )
)

# ¿Cuál de los dos modelos es más apropiado para explicar la variable de
# interés? Calcule el AIC para decidir.

print(paste(
    "El valor de AIC para esta función de log-verosimilitud
    basada en los metros cuadrados del apartamento es de: ",
    AIC(fit1)
))


print(paste(
    "El valor de AIC para esta función de log-verosimilitud
    basada en el valor de la escritura del apartamento es de: ",
    AIC(fit2)
))

print(paste(
    "El valor de AIC para esta función de log-verosimilitud
    basada en el estrato o  nivel socieconomico donde está el
    apartamento es de: ",
    AIC(fit3)
))

print("El modelo más adecuado para explicar la variable de interés es
el correspondiente al estrato o nivel socioeconómico donde está el
apartamento, puesto que si valor de AIC es el más bajo")

# 4.- Considere el siguiente modelo de regresión.
# yi ~ Gamma(shapei, scalei)
# log(shapei)=3-7x1
# log(scalei)=3-1x2
# x1~U(0,1)
# x2~Poisson(<U+03BB>=3)
# Simule 100 observaciones del modelo anterior.

n <- 100
x1 <- runif(n, 0, 1)
x2 <- rpois(n, lambda = 3)

# Escriba el vector de parámetros del problema.

shape <- exp(3 - 7 * x1)
scale <- exp(3 - x2)
y <- rgamma(n, shape, scale)
# Construya la función minusll para el problema.

ll <- function(param) {
    shape <- param[1] # param es el vector de parámetros
    scale <- param[2]
    sum(rgamma(n = y, shape = shape, scale = scale))
}

# Use la función optim para estimar los parámetros del problema

res <- optim(
    par = c(0, 0, 1),
    fn = minusll,
    method = "L-BFGS-B",
    lower = c(-Inf, -Inf, 0),
    upper = c(Inf, Inf, Inf),
    y = y,
    x1 = x1
)
print(res)
