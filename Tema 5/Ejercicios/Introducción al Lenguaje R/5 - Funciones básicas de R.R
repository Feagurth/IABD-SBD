# Use funciones o procedimientos (varias líneas) de R para responder cada una de
# las siguientes preguntas.
# 1.- ¿Qué cantidad de dinero sobra al repartir 10000$ entre 3 personas?
cantidad <- 10000
personas <- 3

resto <- cantidad %% personas
print(paste("El dinero restante es: ", resto, "$", sep = ""))

# 2.- ¿Es el número 4560 divisible por 3?

dividendo <- 4560
divisor <- 3

if ((dividendo %% divisor) == 0) {
    print(paste(dividendo, "es divisible por", divisor))
} else {
    print(paste(dividendo, "no es divisible por", divisor))
}

# 3.- Construya un vector con los números enteros del 2 al 87. ¿Cuáles de esos
# números son divisibles por 7?
a <- seq(from = 2, to = 87)
print(a[a %% 7 == 0])

# 4.- Construya dos vectores, el primero con los números enteros desde 7 hasta
# 3,el segundo vector con los primeros cinco números positivos divisibles por 5.
# Sea A la condición de ser par en el primer vector. Sea B la condición de ser
# mayor que 10 en el segundo vector. ¿En cuál de las 5 posiciones se cumple
# A y B simultáneamente?

a <- seq(from = 7, to = 3)
b <- seq(from = 5, by = 5, length.out = 5)
print((a %% 2 == 0) == (b > 10))

# 5.- Consulte este enlace
#[https://github.com/fhernanb/Manual-de-R/blob/master/images/anecdota_gauss.PNG]
# en el cual hay una anéctoda de Gauss niño. Use R para obtener el resultado de
# la suma solicitada por el profesor del niño Gauss.

a <- seq(from = 1, to = 100)
print(sum(a))

# 6.- Construya un vector con los siguientes elementos: 1, -4, 5, 9, -4.
# Escriba un procedimiento para extraer las posiciones donde está el valor
# mínimo en el vector.

a <- c(1, -4, 5, 9, -4)
b <- min(a)
which(b == a)

# 7.- Calcular  8!
a <- seq(from = 1, to = 8)
prod(a)

# 8.- Evaluar la siguiente suma ∑(i=7)(i=3) e^i

a <- seq(from = 7, to = 3)
sum(exp(a))

# 9.- Evaluar la siguiente productoria ∏(i=10)(i=1)log√i

a <- seq(from = 10, to = 1)
prod(log10(sqrt(a)))

# 10.- Construya un vector cualquiera e inviertalo, es decir, que el primer
# elemento quede de último, el segundo de penúltimo y así sucesivamente.
# Compare su resultado con el de la función rev

a <- c(1, 5, 7, 6, 8, 9, 4, 3)
b <- a[length(a):1]
print(b == rev(a))

# 11.- Create the vector: 1,2,3,…,19,20

a <- seq(from = 1, to = 20)
print(a)

# 12.- Create the vector:  20,19,…,2,1

a <- seq(from = 20, to = 1)
print(a)

# 13.- Create the vector: 1, -2, 3, -4, 5, -6,…, 19, -20.

a <- seq(1, 20)
a[a %% 2 == 0] <- a[a %% 2 == 0] * -1
print(a)

# 14.- Create the vector:  0.1^3, 0.2^1, 0.1^6, 0.2^4,..., 0.1^36, 0.2^34

a <- c(0.1, 0.2)
a <- rep(a, times = 12)
seq1 <- seq(from = 1, to = 12) * 3
seq2 <- seq(from = 1, to = 34, by = 3)

a[which(a == 0.1)] <- a[which(a == 0.1)]^seq1
a[which(a == 0.2)] <- a[which(a == 0.2)]^seq2

print(a)

# 15.- Calculate the following: ∑(100)(i=10)(i^3 + 4i^2) and
# ∑(25)(i=1)((2^i/i)+(3^i/i^2).

a <- seq(from = 100, to = 10)
b <- sum(a^3 + 4 * a^2)

print(b)

a <- seq(from = 25, to = 1)
b <- sum(((2^a) / a) + ((3^a) / (a^2)))

print(b)

# 16.- Read the data set available in:
# https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt

a <- read.csv(
    url(
        "https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt"
    ),
    header = TRUE,
    sep = "\t",
    fileEncoding = "utf-8"
)

print(a)

# 17.- Use a code to obtain the number of variables of the data set.

print(paste("El número de variables del conjunto de datos es: ", length(a)))

# 18.- Use a code to obtain the number of countries in the data set

print(length(a$Pais))

# 19.- Which is the country with the higher population?

b <- subset(a, subset = poblacion == max(poblacion))
print(b)

# 20.- Which is the country with the lowest literacy rate?

b <- subset(a, subset = alfabetizacion == min(alfabetizacion))
print(b)

# 21.- ¿Qué valor de verdad tiene la siguiente afirmación?
# "Los resultados de la función floor y trunc son siempre los mismos."

# La afirmación no es correcta, puesto que en el caso de valores negativos
# los resultados varían. Puede verse un ejemplo de este caso en el siguiente
# código

print(floor(-3.7935))
print(trunc(-3.7935))

# En R hay unas bases de datos incluídas, una de ellas es la base de datos
# llamada tcars. Para conocer las variables que están en mtcars usted puede
# escribir en la consola ?mtcars o también help(mtcars). De la base mtcars
# obtenga bases de datos que cumplan las siguientes condiciones.

# 22.- Autos que tengan un rendimiento menor a 18 millas por galón de
# combustible.

b <- subset(mtcars, subset = mpg < 18)
print(b)

# 23.- Autos que tengan 4 cilindros.

b <- subset(mtcars, subset = cyl == 4)
print(b)

# 24.- Autos que pesen más de 2500 libras y tengan transmisión manual.

b <- subset(mtcars, subset = (wt > 2.500) & (am == 0))
print(b)
