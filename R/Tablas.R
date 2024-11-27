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
tabla_resumen_temperatura <- function(nombre_dataset = NULL, data = NULL) {
  # Verificar si se proporcionó un dataset directamente
  if (!is.null(data)) {
    datos <- data
  } else if (!is.null(nombre_dataset)) {
    # Verificar si el dataset existe en el paquete
    if (!exists(nombre_dataset, envir = asNamespace("PaqueteDatosMeteorologicos"))) {
      stop("El dataset especificado no existe en el paquete.")
    }
    datos <- get(nombre_dataset, envir = asNamespace("PaqueteDatosMeteorologicos"))
  } else {
    stop("Debe especificar un dataset o un nombre de dataset.")
  }

  # Verificar que todas las columnas requeridas están presentes
  columnas_requeridas <- c(
    "temperatura_abrigo_150cm",
    "temperatura_abrigo_150cm_minima",
    "temperatura_abrigo_150cm_maxima"
  )

  columnas_faltantes <- setdiff(columnas_requeridas, colnames(datos))
  if (length(columnas_faltantes) > 0) {
    stop(sprintf(
      "Faltan las siguientes columnas en los datos: %s",
      paste(columnas_faltantes, collapse = ", ")
    ))
  }

  # Calcular el resumen
  resumen <- datos |>
    dplyr::summarise(
      promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desviacion_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE),
      minima = min(temperatura_abrigo_150cm_minima, na.rm = TRUE),
      maxima = max(temperatura_abrigo_150cm_maxima, na.rm = TRUE)
    )

  return(resumen)
}








