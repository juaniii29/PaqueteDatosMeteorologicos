test_that("Error si el dataset especificado no existe", {
  expect_error(tabla_resumen_temperatura("dataset_inexistente"), "El dataset especificado no existe en el paquete.")
})

test_that("Manejo de valores NA en 'temperatura_abrigo_150cm'", {
  # Supón que el dataset "NH0910" tiene algunos valores NA en "temperatura_abrigo_150cm"
  resultado <- tabla_resumen_temperatura("NH0910")

  # Verifica que el cálculo del promedio ignore los NA
  expect_true(!is.na(resultado$promedio_temperatura))
})

test_that("La salida tiene exactamente una fila", {
  # Ejecuta la función con un dataset válido, como "NH0910"
  resultado <- tabla_resumen_temperatura("NH0910")

  # Verifica que la salida sea un data.frame
  expect_s3_class(resultado, "data.frame")

  # Verifica que el resultado tenga exactamente una fila
  expect_equal(nrow(resultado), 1)
})


