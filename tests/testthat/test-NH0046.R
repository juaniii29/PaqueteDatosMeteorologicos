library(testthat)

# Crear la carpeta si no existe
dir.create(file.path(getwd(), "data_raw"), recursive = TRUE, showWarnings = FALSE)

# Test para verificar que el dataset `NH0046` tiene las columnas correctas
test_that("NH0046 dataset tiene las columnas correctas", {
  # Cargar el dataset
  NH0046 <- get_data("NH0046")

  # Verificar el número de columnas y sus nombres
  expect_equal(ncol(NH0046), 11)

  # Definir las columnas esperadas
  expected_columns <- c("id", "fecha", "temperatura_abrigo_150cm",
                        "temperatura_abrigo_150cm_maxima", "temperatura_abrigo_150cm_minima",
                        "temperatura_intemperie_5cm_minima", "temperatura_intemperie_50cm_minima",
                        "temperatura_suelo_5cm_media", "temperatura_suelo_10cm_media",
                        "temperatura_inte_5cm", "temperatura_intemperie_150cm_minima",
                        "humedad_suelo", "precipitacion_pluviometrica", "granizo",
                        "nieve", "heliofania_efectiva", "heliofania_relativa",
                        "tesion_vapor_media", "humedad_media",
                        "humedad_media_8_14_20", "rocio_medio",
                        "duracion_follaje_mojado", "velocidad_viento_200cm_media",
                        "direccion_viento_200cm", "velocidad_viento_1000cm_media",
                        "direccion_viento_1000cm", "velocidad_viento_maxima",
                        "presion_media", "radiacion_global", "radiacion_neta",
                        "evaporacion_tanque", "evapotranspiracion_potencial",
                        "profundidad_napa", "horas_frio", "unidad_frio")

  expect_equal(colnames(NH0046), expected_columns)
})

# Test para verificar que `get_data` descarga y lee el archivo correctamente
test_that("get_data descarga y lee el archivo correctamente", {
  # Verificar que el dataset se carga y tiene filas y columnas
  NH0046 <- get_data("NH0046")
  expect_true(nrow(NH0046) > 0)
  expect_equal(ncol(NH0046), 35)
})

# Test para verificar que `get_data` lanza un error si la URL es incorrecta
test_that("get_data lanza un error con una URL incorrecta", {
  incorrect_url <- "https://example.com/archivo_inexistente.csv"

  expect_error(
    {
      url <- incorrect_url
      destfile <- file.path(getwd(), "data_raw", "NH0046_incorrect.csv")
      download.file(url = url, destfile = destfile)
      NH0910 <<- readr::read_csv(destfile)
    },
    "Error en la descarga del archivo desde la URL proporcionada."
  )
})

# Test para verificar que `get_data` lanza un error si el archivo descargado no es un CSV válido
test_that("get_data lanza un error si el archivo descargado no es un CSV válido", {
  destfile <- file.path(getwd(), "data_raw", "NH0046_invalid.csv")

  # Crear archivo no válido temporalmente
  writeLines("Este no es un archivo CSV válido.", destfile)

  # Asegúrate de que la función get_data lea correctamente el archivo
  expect_error(get_data("NH0046_invalid"), "No se pudo leer el archivo descargado. Verifique que el archivo sea un CSV válido.")

  # Borrar el archivo temporal después del test
  unlink(destfile)
})
