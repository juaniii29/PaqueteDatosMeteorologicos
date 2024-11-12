test_that('La conversion se realizo con exito', {
  expect_equal(convertir_cf(20), 68)
})

test_that('No funciona con caracteres', {
  expect_error(convertir_cf('20'), 'El argumento temp_celsius debe ser numerico')
})

test_that('No funciona con NA', {
  expect_error(convertir_cf(NA), 'El argumento temp_celsius debe ser numerico')
})

test_that('La conversion de un vector numerico se realizo con exito', {
  expect_equal(convertir_cf(c(0, 100)), c(32, 212))
})

test_that('La conversion de temperatura negativa se realizo con exito', {
  expect_equal(convertir_cf(-40), -40)
})

test_that('La conversion de 0°C se realizo con exito', {
  expect_equal(convertir_cf(0), 32)
})
