test_that("La función devuelve un data frame cuando la estación existe", {
  resultado <- tabla_resumen_temperatura(NH0910)
  expect_s3_class(resultado, "data.frame")

  resultado <- tabla_resumen_temperatura(NH0046)
  expect_s3_class(resultado, "data.frame")
})


test_that("Error si faltan columnas requeridas en los datos", {
  NH0910_incompleto <- data.frame(
    temperatura_abrigo_150cm = c(10, 15, 20)
  )
   expect_error(
    tabla_resumen_temperatura(NH0910_incompleto),
    "Faltan las siguientes columnas en los datos: temperatura_abrigo_150cm_minima, temperatura_abrigo_150cm_maxima"
  )
})


test_that("La función devuelve datos resumidos correctos", {
  resultado <- tabla_resumen_temperatura(NH0910)

  expect_equal(resultado$promedio_temperatura, mean(NH0910$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resultado$desviacion_estandar, sd(NH0910$temperatura_abrigo_150cm, na.rm = TRUE))
  expect_equal(resultado$minima, min(NH0910$temperatura_abrigo_150cm_minima, na.rm = TRUE))
  expect_equal(resultado$maxima, max(NH0910$temperatura_abrigo_150cm_maxima, na.rm = TRUE))
})
