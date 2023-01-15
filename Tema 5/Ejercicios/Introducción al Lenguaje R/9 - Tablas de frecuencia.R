# Use funciones o procedimientos (varias líneas) de R para responder cada una de
# las siguientes preguntas.
# En el Cuadro 8.2 se presenta una base de datos sencilla. Lea la base de datos
# usando la funcion read.table y construya lo que se solicita a continuación.
# 1.- Construya una tabla de frecuencia absoluta para la variable pasatiempo.

datos <- read.table(
    file = "8-2 - Datos Personales.txt",
    header = TRUE,
    sep = "\t"
)
print(datos)

pasatiempos <- table(datos$Pasatiempo)
print(pasatiempos)

# 2.- Construya una tabla de frecuencia relativa para la variable fuma.

fuma <- table(datos$Fuma)
print(prop.table(x = fuma))

# 3.- Construya una tabla de frecuencia relativa para las variables pasatiempo
# y fuma.

pasatiempos_fuma <- table(datos$Pasatiempo, datos$Fuma)
relativa <- (prop.table(x = pasatiempos_fuma))
print(relativa)

# 4.- ¿Qué porcentaje de de los que no fuman tienen como pasatiempo la lectura.
print(paste(
    "El porcentaje de personas lectoras no fumadoras es de ",
    relativa["Lectura", "No"],
    "%",
    sep = ""
))

# 5.- ¿Qué porcentaje de los que corren no fuman?
print(paste(
    "El porcentaje de personas corredoras no fumadores es de ",
    relativa["Correr", "No"],
    "%",
    sep = ""
))