#' Descargar datos de distintas estaciones meteorologicas
#'
#' La funcion 'descargar_datos()' toma como parametro el id de alguna de las
#' estaciones que se solicite para luego realizar la descarga y lectura del dataset
#'
#' Estos son detalles extra de la funcion
#'
#' @param id_estacion un string de letras y numeros
#'
#' @return
#' La informacion que contiene el dataset que fue descargado
#'
#' @example
#' data <- descargar_datos("NH0046")
#'
#' @export
descargar_datos <- function(id_estacion) {
  estacion_url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/", id_estacion, ".csv")
  ruta <- paste0(tempdir(), "/", id_estacion, ".csv")

  if (file.exists(ruta)) {
    datos_estacion <- utils::read.csv(ruta)
    cli::cli_inform("Lectura del archivo de estación '{id_estacion}' desde el directorio temporal.")
  } else {
    tryCatch({
      utils::download.file(estacion_url, ruta, mode = "wb")
      datos_estacion <- utils::read.csv(ruta)
      cli::cli_inform("Descargando y leyendo el archivo de estación '{id_estacion}' en el directorio temporal.")
    }, error = function(e) {
      stop(paste("Error al descargar o leer los datos de la estación:", e$message))
    })
  }

}
