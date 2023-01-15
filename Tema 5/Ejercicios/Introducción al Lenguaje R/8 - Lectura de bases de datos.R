# En el Cuadro 8.2 se presenta una base de datos sencilla. Almacene la
# información del cuadro en dos archivos diferentes, en Excel y en bloc de notas
# Lea los dos archivos con la función read.table y compare los resultados
# obtenidos con la del Cuadro 8.2 fuente.

datos_tab <- read.table(
    file = "8-2 - Datos Personales.txt",
    header = TRUE,
    sep = "\t"
)

datos_csv <- read.table(
    file = "8-2 - Datos Personales.csv",
    header = TRUE,
    sep = ","
)

print(datos_tab)
print(datos_csv)

# En la url
# https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo
# están disponibles los datos sobre medidas corporales para un grupo de
# estudiante de la universidad, use la función read.table para leer la base de
# datos.

datos <- read.table(
    file = "https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo", # nolint: line_length_linter.
    header = TRUE,
    sep = "\t"
)

print(datos)