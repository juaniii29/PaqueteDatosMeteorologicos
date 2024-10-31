#' Tabla de resumen
#'
#' @param nombre_archivo
#'
#' @return
#' @export
#'
#' @examples
tabla_resumen_temperatura <- function(nombre_archivo) {

  ruta <- paste0("data/", nombre_archivo, ".csv.rda")

  load(ruta)

  nombre_objeto <- ls()[ls() != "nombre_archivo" & ls() != "ruta"]
  data <- get(nombre_objeto)

  if ("temperatura_abrigo_150cm" %in% colnames(data)) {
<<<<<<< HEAD
    resumen <- data %>%
=======
    # Crear un resumen sin agrupación (asumiendo que es para una sola estación)
    resumen <- data |>
>>>>>>> 8fc4b76b6875ea0a5559098feb5faf14461215f4
      dplyr::summarise(
        promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
        desviacion_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE)
      )
  } else {
    stop("La columna 'temperatura_abrigo_150cm' no esta presente en los datos.")
  }

  return(resumen)
}


