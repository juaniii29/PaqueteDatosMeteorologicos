#' Funcion para descargar y leer sarchivoss
#'
#' La funcion `download_file()` toma la direccion de donde descargar el archivo y la ruta y nombre de archivo donde se guardará.
#'
#' @param url
#' @param destfile
#' @param method
#'
#' @return
#' @export
#'
#' @examples
download_file <- function(url, destfile, method = "auto") {
  tryCatch({
    download.file(url, destfile, method = method)
    message("Archivo descargado exitosamente en: ", destfile)
  }, error = function(e) {
    message("Error al descargar el archivo: ", e$message)
  })
}

download_file("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv", "datos/metadatos.csv")

