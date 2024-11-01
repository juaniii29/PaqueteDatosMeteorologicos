test_that('La conversion se realizo con exito', {
  expect_equal(clasificar_temperatura(28), "Caliente")
})

test_that('No funciona con caracteres', {
  expect_error(clasificar_temperatura('11'), 'El argumento debe ser numerico, la variable ingesada es un caracter')
})

