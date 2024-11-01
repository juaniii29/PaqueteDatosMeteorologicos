#' Gráfico de temperatura media mensual para estaciones meteorológicas
#'
#' La funcion `grafico_temperatura` toma un dataset con informacion sobre estaciones meteorologicas y devuelve un grafico de la temperatura media mensual por estación
#'
#' Estos son detalles extra de la funcion
#'
#' @param dataset Un data frame que contiene la información de las estaciones meteorológicas. Debe tener al menos las columnas `fecha` (tipo Date o POSIXt), `temperatura_abrigo_150cm` y `id` (identificador de estación).
#' @param colores Un vector opcional de colores a usar para las distintas estaciones en el gráfico. Si no se especifica o si no contiene suficientes colores, se generará automáticamente un conjunto de colores aleatorios.
#' @param titulo Un string con el título del gráfico. El valor predeterminado es `"Temperatura Abrigo"`.
#'
#' @return Un objeto `ggplot` que representa un gráfico de línea de la temperatura media mensual
#'
#' @examples
#'grafico_temperatura(NH0046)
#'
#' @export
  grafico_temperatura <- function(dataset, colores = NULL, titulo = "Temperatura Abrigo") {
  # Cargar dplyr si no está disponible
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    install.packages("dplyr")
  }
  library(dplyr)

  # Validaciones del argumento `dataset` y columnas requeridas
  if (!is.data.frame(dataset)) {
    cli::cli_abort("El argumento 'dataset' debe ser un data frame.")
  }

  required_cols <- c("fecha", "temperatura_abrigo_150cm", "id")
  missing_cols <- setdiff(required_cols, colnames(dataset))

  if (length(missing_cols) > 0) {
    cli::cli_abort("El 'dataset' no contiene las columnas necesarias: {paste(missing_cols, collapse = ', ')}.")
  }

  if (!inherits(dataset$fecha, "Date") && !inherits(dataset$fecha, "POSIXt")) {
    cli::cli_abort("La columna 'fecha' debe ser de tipo Date o POSIXt.")
  }

  # Definir colores de estaciones si no se proporcionan suficientes colores
  num_estaciones <- length(unique(dataset$id))
  if (is.null(colores) || length(colores) < num_estaciones) {
    colores <- sample(colors(), num_estaciones)
  }

  # Crear gráfico de temperatura media mensual por estación
  grafico <- dataset %>%
    dplyr::mutate(mes = lubridate::month(fecha)) %>%
    dplyr::group_by(id, mes) %>%
    dplyr::summarise(temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE), .groups = "drop") %>%
    ggplot2::ggplot(ggplot2::aes(mes, temperatura_media)) +
    ggplot2::geom_line(ggplot2::aes(color = id), linewidth = 1.4) +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(x = "Mes", y = "Temperatura Media (°C)", title = titulo, color = "ID") +
    ggplot2::theme_minimal(base_size = 14)

  return(grafico)
}

