# Use funciones o procedimientos (varias líneas) de R para responder cada una de las siguientes preguntas.
# 1.- Construya un vector con la primeras 20 letras MAYÚSCULAS usando la función LETTERS.

mayusculas <- c(LETTERS[1:20])
mayusculas

# 2.- Construya una matriz de  10×10 con los primeros 100 números positivos pares.

matriz <- matrix(data = seq(2, 100, by = 2), nrow = 10, ncol = 10, byrow = FALSE)
matriz

# 3.- Construya una matriz identidad de dimension  3×3. Recuerde que una matriz identidad tiene sólo unos en la diagonal principal y los demás elementos son cero.

matriz_diagonal <- matrix(data = 0, nrow = 3, ncol = 3, byrow = FALSE)
matriz_diagonal[1, 1] <- 1
matriz_diagonal[2, 2] <- 1
matriz_diagonal[3, 3] <- 1
matriz_diagonal

# 4.- Construya una lista con los anteriores tres objetos creados.

lista <- list(E1 = mayusculas, E2 = matriz, E3 = matriz_diagonal)
lista

# 5.- Construya un marco de datos o data frame con las respuestas de 3 personas a las preguntas:
#   (a) ¿Cuál es su edad en años?
#   (b) ¿Tipo de música que más le gusta?
#   (c) ¿Tiene usted pareja sentimental estable?

edad <- c(45, 77, 43)
musica <- c("Rap", "Rock", "Indie")
relacion <- c(FALSE, FALSE, FALSE)
marco <- data.frame(edad, musica, relacion)
marco

# 6.- ¿Cuál es el error al correr el siguiente código? ¿A qué se debe?
# edad <- c(15, 19, 13, NA, 20)
# deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
# comic_fav <- c(NA, "Superman", "Batman", NA, "Batman")
# matrix(edad, deporte, comic_fav)

# El error que se produce es: Error in matrix(edad, deporte, comic_fav) : non-numeric matrix extent
# Esto es debido a que ha intentado crear una matriz con diversos tipos de datos distintos
# cuando una matriz debe tener todos los datos del mismo tipo
