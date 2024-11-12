test_that("Error si el dataset especificado no existe", {
  expect_error(tabla_resumen_temperatura("dataset_inexistente"), "El dataset especificado no existe en el paquete.")
})

test_that("Error cuando falta la columna 'temperatura_abrigo_150cm'", {
  mock_data <- data.frame(otra_columna = c(1, 2, 3))
  assign("dataset_sin_columna", mock_data, envir = asNamespace("PaqueteDatosMeteorologicos"))

  expect_error(
    tabla_resumen_temperatura("dataset_sin_columna"),
    "La columna 'temperatura_abrigo_150cm' no está presente en los datos."
  )
})

test_that("Cálculo correcto del resumen estadístico", {
  mock_data <- data.frame(
    temperatura_abrigo_150cm = c(10, 20, 30, 40, NA),
    temperatura_abrigo_150cm_minima = c(5, 15, 25, 35, NA),
    temperatura_abrigo_150cm_maxima = c(15, 25, 35, 45, NA)
  )
  assign("dataset_con_columna", mock_data, envir = asNamespace("PaqueteDatosMeteorologicos"))

  resultado <- tabla_resumen_temperatura("dataset_con_columna")

  expect_equal(resultado$promedio_temperatura, mean(mock_data$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resultado$desviacion_estandar, sd(mock_data$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resultado$minima, min(mock_data$temperatura_abrigo_150cm_minima, na.rm = TRUE))
  expect_equal(resultado$maxima, max(mock_data$temperatura_abrigo_150cm_maxima, na.rm = TRUE))
})

test_that("Formato de salida correcto", {
  mock_data <- data.frame(
    temperatura_abrigo_150cm = c(10, 20, 30),
    temperatura_abrigo_150cm_minima = c(5, 15, 25),
    temperatura_abrigo_150cm_maxima = c(15, 25, 35)
  )
  assign("dataset_valido", mock_data, envir = asNamespace("PaqueteDatosMeteorologicos"))

  resultado <- tabla_resumen_temperatura("dataset_valido")

  expect_s3_class(resultado, "data.frame")
  expect_true(all(c("promedio_temperatura", "desviacion_estandar", "minima", "maxima") %in% colnames(resultado)))
})
