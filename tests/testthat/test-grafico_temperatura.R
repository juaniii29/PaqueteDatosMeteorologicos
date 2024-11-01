test_that("grafico_temperatura lanza un error cuando dataset no es un data frame", {
  expect_error(grafico_temperatura("no es un data frame"), "El argumento 'dataset' debe ser un data frame.")
})

test_that("grafico_temperatura devuelve un objeto ggplot", {
  dataset_prueba <- data.frame(
    fecha = as.Date(c("2022-01-01", "2022-02-01", "2022-03-01", "2022-01-01")),
    temperatura_abrigo_150cm = c(15, 20, 25, 18),
    id = c("A", "A", "B", "B")
  )

  grafico <- grafico_temperatura(dataset_prueba)
  expect_s3_class(grafico, "ggplot")
})
