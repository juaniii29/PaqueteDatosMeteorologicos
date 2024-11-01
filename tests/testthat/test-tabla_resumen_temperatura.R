library(testthat)
library(dplyr)

test_that("tabla_resumen_temperatura devuelve un data frame", {
  datos_prueba <- data.frame(
    temperatura_abrigo_150cm = c(10, 15, 20, 25),
    temperatura_abrigo_150cm_minima = c(5, 10, 15, 20),
    temperatura_abrigo_150cm_maxima = c(15, 20, 25, 30)
  )

  resumen <- tabla_resumen_temperatura("test_data")
  expect_s3_class(resumen, "data.frame")
})

test_that("tabla_resumen_temperatura calcula correctamente mínimos, máximos y promedios", {
  datos_prueba <- data.frame(
    temperatura_abrigo_150cm = c(10, 15, 20, 25),
    temperatura_abrigo_150cm_minima = c(5, 10, 15, 20),
    temperatura_abrigo_150cm_maxima = c(15, 20, 25, 30)
  )

  save(datos_prueba, file = "data/test_data.rda")
  resumen <- tabla_resumen_temperatura("test_data")

  expect_equal(resumen$promedio_temperatura, mean(datos_prueba$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resumen$desviacion_estandar, sd(datos_prueba$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resumen$minima, min(datos_prueba$temperatura_abrigo_150cm_minima, na.rm = TRUE))
  expect_equal(resumen$maxima, max(datos_prueba$temperatura_abrigo_150cm_maxima, na.rm = TRUE))
})

test_that("tabla_resumen_temperatura maneja valores nulos correctamente", {
  datos_prueba <- data.frame(
    temperatura_abrigo_150cm = c(10, NA, 20, 25),
    temperatura_abrigo_150cm_minima = c(5, NA, 15, 20),
    temperatura_abrigo_150cm_maxima = c(15, 20, NA, 30)
  )

  save(datos_prueba, file = "data/test_data_with_na.rda")
  resumen <- tabla_resumen_temperatura("test_data_with_na")

  expect_equal(resumen$promedio_temperatura, mean(datos_prueba$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resumen$desviacion_estandar, sd(datos_prueba$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resumen$minima, min(datos_prueba$temperatura_abrigo_150cm_minima, na.rm = TRUE))
  expect_equal(resumen$maxima, max(datos_prueba$temperatura_abrigo_150cm_maxima, na.rm = TRUE))
})
