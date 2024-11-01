test_that("clasificar_temperatura lanza error con caracteres", {
  expect_error(clasificar_temperatura("11"), "El argumento debe ser numérico.")
})

test_that("clasificar_temperatura funciona correctamente", {
  expect_equal(clasificar_temperatura(10), "Frio")
  expect_equal(clasificar_temperatura(20), "Templado")
  expect_equal(clasificar_temperatura(30), "Caliente")
})
