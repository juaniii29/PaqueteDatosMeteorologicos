tabla_resumen_temperatura <- function(nombre_archivo) {

  ruta <- paste0("data/", nombre_archivo, ".csv.rda")

  load(ruta)

  nombre_objeto <- ls()[ls() != "nombre_archivo" & ls() != "ruta"]
  data <- get(nombre_objeto)

  if ("temperatura_abrigo_150cm" %in% colnames(data)) {
    # Crear un resumen sin agrupación (asumiendo que es para una sola estación)
    resumen <- data %>%
      dplyr::summarise(
        promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
        desviacion_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE)
      )
  } else {
    stop("La columna 'temperatura_abrigo_150cm' no está presente en los datos.")
  }

  return(resumen)
}

tabla_resumen_temperatura('NH0437')
