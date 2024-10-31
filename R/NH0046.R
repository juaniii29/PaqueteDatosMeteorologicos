#' NH0046
#'
#' Este es un dataset de ejemplo que contiene información sobre estaciones meteorologicas, incluyendo fechas de operación.
#'
#'
#' @format Un data frame con estas 35 variables:
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
#'   \item{temperatura_inte_5cm}{Temperatura medida a 5 cm en intemperie, valores NA.}
#'   \item{temperatura_intemperie_150cm_minima}{Temperatura mínima en intemperie a 150 cm, valores NA.}
#'   \item{humedad_suelo}{Humedad del suelo, valores NA.}
#'   \item{precipitacion_pluviometrica}{Precipitación pluviométrica en mm, datos numéricos.}
#'   \item{granizo}{Indica presencia de granizo, valores NA.}
#'   \item{nieve}{Indica presencia de nieve, valores NA.}
#'   \item{heliofania_efectiva}{Heliofanía efectiva, valores NA.}
#'   \item{heliofania_relativa}{Heliofanía relativa, valores NA.}
#'   \item{tesion_vapor_media}{Tensión de vapor media, valores NA.}
#'   \item{humedad_media}{Humedad relativa media, valores NA.}
#'   \item{humedad_media_8_14_20}{Humedad relativa media registrada a las 8, 14 y 20 horas, valores NA.}
#'   \item{rocio_medio}{Punto de rocío medio, valores NA.}
#'   \item{duracion_follaje_mojado}{Duración del follaje mojado, valores NA.}
#'   \item{velocidad_viento_200cm_media}{Velocidad media del viento a 200 cm de altura, valores NA.}
#'   \item{direccion_viento_200cm}{Dirección del viento a 200 cm de altura, valores NA.}
#'   \item{velocidad_viento_1000cm_media}{Velocidad media del viento a 1000 cm de altura, valores NA.}
#'   \item{direccion_viento_1000cm}{Dirección del viento a 1000 cm de altura, valores NA.}
#'   \item{velocidad_viento_maxima}{Velocidad máxima del viento registrada, valores NA.}
#'   \item{presion_media}{Presión atmosférica media, valores NA.}
#'   \item{radiacion_global}{Radiación solar global medida en la estación, valores NA.}
#'   \item{radiacion_neta}{Radiación neta medida en la estación, valores NA.}
#'   \item{evaporacion_tanque}{Evaporación medida en tanque, valores NA.}
#'   \item{evapotranspiracion_potencial}{Evapotranspiración potencial, valores NA.}
#'   \item{profundidad_napa}{Profundidad de la napa freática, valores NA.}
#'   \item{horas_frio}{Cantidad de horas de frío registradas, valores numéricos.}
#'   \item{unidad_frio}{Unidad de medida para las horas de frío, valores NA.}
#' }
#' @source Los datos fueron obtenidos de los materiales otorgados en la clase de Programacion II.
<<<<<<< HEAD
#' @export
=======
#'
#'
>>>>>>> 4c3f922ced1301f13f0b25de80dffe7812b8e278
#' @examples
#' #Cargar el dataset
#' data(NH0046)
#'
#' #Ver las primeras filas del dataset
#' head(NH0046)
#'
#' @export
get_data <- function(estacion, destfile) {
  # Construir la URL usando el nombre de la estación
  url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/", estacion, ".csv")

  destfile <- file.path(getwd(), "data", "DATOS", paste0(estacion, ".csv"))

  tryCatch({
    download.file(url = url, destfile = destfile)
  }, error = function(e) {
    cli::cli_abort("Error en la descarga del archivo desde la URL proporcionada.")
  })

  tryCatch({
    NH0046 <<- readr::read_csv(destfile)
  }, error = function(e) {
    cli::cli_abort("No se pudo leer el archivo descargado. Verifique que el archivo sea un CSV válido.")
  })

  return(NH0046)
}


