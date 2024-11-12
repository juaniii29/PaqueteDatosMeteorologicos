test_that('La conversion se realizo con exito', {
  expect_equal(convertir_fc(50), 10)
})

test_that('No funciona con caracteres', {
  expect_error(convertir_fc('50'), 'El argumento temp_fahrenheit debe ser numerico')
})

test_that('No funciona con NA', {
  expect_error(convertir_fc(NA), 'El argumento temp_fahrenheit debe ser numerico')
})

test_that('La conversion de un vector numerico se realizo con exito', {
  expect_equal(convertir_fc(c(32, 212)), c(0, 100))
})

test_that('La conversion de temperatura negativa se realizo con exito', {
  expect_equal(convertir_fc(-40), -40)
})

test_that('La conversion de 0°F se realizo con exito', {
  expect_equal(convertir_fc(0), -17.77778, tolerance = 1e-5)
})
