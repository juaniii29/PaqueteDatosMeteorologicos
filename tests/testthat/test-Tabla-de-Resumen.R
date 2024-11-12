test_that("Error si el dataset especificado no existe", {
  expect_error(tabla_resumen_temperatura("dataset_inexistente"), "El dataset especificado no existe en el paquete.")
})


