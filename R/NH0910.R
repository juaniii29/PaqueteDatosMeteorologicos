#' NH0910
#'
#' Este es un dataset de ejemplo que contiene información sobre estaciones meteorologicas, incluyendo ubicación, tipo, y fechas de operación.
#'
#'
#' @format Un data frame con 15.553 filas y 35 variables:
#' \describe{
#'   \item{id}{ID de la estacion, datos categoricos.}
#'   \item{fecha}{Fecha de la medicion, datos temporales.}
#'   \item{temperatura_abrigo_150cm}{Temperatura medida en abrigo a 150 cm, datos numéricos.}
#'   \item{temperatura_abrigo_150cm_maxima}{Temperatura máxima en abrigo a 150 cm, datos numéricos.}
#'   \item{temperatura_abrigo_150cm_minima}{Temperatura mínima en abrigo a 150 cm, datos numéricos.}
#'   \item{temperatura_intemperie_5cm_minima}{Temperatura mínima medida en intemperie a 5 cm del suelo, valores NA.}
#'   \item{temperatura_intemperie_50cm_minima}{Temperatura mínima medida en intemperie a 50 cm del suelo, valores NA.}
#'   \item{temperatura_suelo_5cm_media}{Temperatura media medida en el suelo a 5 cm de profundidad, valores NA.}
#'   \item{temperatura_suelo_10cm_media}{Temperatura media medida en el suelo a 10 cm de profundidad, valores NA.}
#'
#'
#'
#'
#'
#' }
#' @source Los datos fueron obtenidos de los materiales otorgados en la clase de Programacion II.
#'
#' @examples
#' #Cargar el dataset
#' data(NH0910)
#'
#' #Ver las primeras filas del dataset
#' head(NH0910)
"NH0910"
