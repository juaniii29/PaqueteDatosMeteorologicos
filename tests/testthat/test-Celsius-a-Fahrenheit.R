test_that('La conversion se realizo con exito', {
  expect_equal(convertir_cf(20), 68)
})

test_that('No funciona con caracteres', {
  expect_error(convertir_cf('20'), 'El argumento temp_celsius debe ser numerico')
})
