test_that('La conversion se realizo con exito', {
  expect_equal(convertir_fc(50), 10)
})

test_that('No funciona con caracteres', {
  expect_error(convertir_fc('50'), 'El argumento temp_fahrenheit debe ser numerico')
})

