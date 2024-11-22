#' Tabla de resumen
#'
#' La funcion `tabla_resumen_temperatura` toma un dataset con informacion sobre estaciones meteorologicas y devuelve un resumen sobre este
#'
#' Estos son detalles extra de la funcion
#'
#' @param nombre_archivo Un string con el nombre del archivo (sin extensión) que contiene el dataset de datos meteorológicos. Este archivo debe estar ubicado en la carpeta "data" y tener la extensión ".csv.rda".
#'
#' @return Un data frame con cuatro columnas:
#' - `promedio_temperatura`: la media de la columna `temperatura_abrigo_150cm`.
#' - `desviacion_estandar`: la desviación estándar de la columna `temperatura_abrigo_150cm`.
#' - `minima`: La temperatura minima de la columna `temperatura_abrigo_150cm_minima`.
#' - `maxima`: La temperatura maxima de la columna `temperatura_abrigo_150cm_maxima`.
#'
#' @examples
#' tabla_resumen_temperatura('NH0910')
#'
#' @export
tabla_resumen_temperatura <- function(data) {
  # Verificar que todas las columnas necesarias estén presentes
  required_columns <- c("temperatura_abrigo_150cm", "temperatura_abrigo_150cm_minima", "temperatura_abrigo_150cm_maxima")
  missing_columns <- setdiff(required_columns, colnames(data))

  if (length(missing_columns) > 0) {
    stop(paste("Faltan las siguientes columnas en los datos:", paste(missing_columns, collapse = ", ")))
  }

  # Calcular el resumen de temperatura
  resumen <- data |>
    dplyr::summarise(
      promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desviacion_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE),
      minima = min(temperatura_abrigo_150cm_minima, na.rm = TRUE),
      maxima = max(temperatura_abrigo_150cm_maxima, na.rm = TRUE)
    )

  return(resumen)
}






