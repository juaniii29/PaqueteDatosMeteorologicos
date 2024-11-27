test_that("clasificar_temperatura lanza error con caracteres", {
  expect_error(clasificar_temperatura("11"), "El argumento debe ser numerico.")
})

test_that("clasificar_temperatura funciona correctamente", {
  expect_equal(clasificar_temperatura(10), "Frio")
  expect_equal(clasificar_temperatura(20), "Templado")
  expect_equal(clasificar_temperatura(30), "Caliente")
})

test_that("clasificar_temperatura clasifica correctamente en los límites", {
  expect_equal(clasificar_temperatura(14.9), "Frio")
  expect_equal(clasificar_temperatura(15), "Templado")
  expect_equal(clasificar_temperatura(25), "Templado")
  expect_equal(clasificar_temperatura(25.1), "Caliente")
})

test_that("clasificar_temperatura clasifica correctamente temperaturas negativas", {
  expect_equal(clasificar_temperatura(-10), "Frio")
})

test_that("clasificar_temperatura lanza error con NULL o NA", {
  expect_error(clasificar_temperatura(NA), "El argumento debe ser numerico.")
})

test_that("clasificar_temperatura clasifica correctamente un vector de temperaturas", {
  expect_equal(clasificar_temperatura(c(10, 20, 30)), c("Frio", "Templado", "Caliente"))
})
