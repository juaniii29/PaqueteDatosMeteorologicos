#' metadatos
#'
#' Este es un dataset de ejemplo que contiene información sobre estaciones meteorologicas, incluyendo ubicación, tipo, y fechas de operación.
#'
#'
#' @format Un data frame con 258 filas y 11 variables:
#' \describe{
#'   \item{id}{ID de la estacion, datos categoricos.}
#'   \item{nombre}{Nombre de la estacion, datos categoricos.}
#'   \item{tipo}{Tipo de estacion, posee datos categoricos.}
#'   \item{localidad}{Ciudad de la estacion, datos categoricos.}
#'   \item{provincia}{Provincia de la estacion, datos categoricos.}
#'   \item{lat}{Latitud de la ubicacion de la estacion, datos numericos.}
#'   \item{lon}{Longitud de la ubicacion de la estacion, datos numericos.}
#'   \item{altura}{Altura de la ubicacion de la estacion, datos numericos.}
#'   \item{ubicacion}{Ubicacion exacta de la estacion, datos categoricos.}
#'   \item{desde}{Fecha en la que inicio la estacion, datos temporales.}
#'   \item{hasta}{Fecha en la que finalizo la estacion, datos temporales}
#' }
#' @source Los datos fueron obtenidos de los materiales otorgados en la clase de Programacion II.
#'
#' @examples
#' #Cargar el dataset
#' data(metadatos)
#'
#' #Ver las primeras filas del dataset
#' head(metadatos)
"metadatos"
