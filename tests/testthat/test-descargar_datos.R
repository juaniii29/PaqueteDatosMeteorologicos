test_that("La función descarga y lee el archivo correctamente cuando no existe en el directorio temporal", {
  # Definir mock_ruta dentro del test
  mock_ruta <- file.path(tempdir(), "NH0046.csv")

  # Ejecutar la función y verificar los mensajes sin que causen fallos
  expect_message({
    descargar_datos("NH0046")
  }, "Descargando y leyendo el archivo de estacion 'NH0046' en el directorio temporal.")  # Esperamos un mensaje

  expect_true(file.exists(mock_ruta))  # Verificamos que el archivo haya sido descargado
})

# Test cuando el archivo ya existe en el directorio temporal
test_that("La función lee el archivo existente del directorio temporal", {
  # Definir mock_ruta dentro del test
  mock_ruta <- file.path(tempdir(), "NH0046.csv")

  # Primero aseguramos que el archivo esté en el directorio temporal
  write.csv(data.frame(a = 1:5, b = 6:10), mock_ruta)

  # Comprobamos que la función lea el archivo sin intentar descargarlo y sin generar fallos
  expect_message({
    descargar_datos("NH0046")
  }, "Lectura del archivo de estacion 'NH0046' desde el directorio temporal.")  # Esperamos un mensaje

  expect_true(file.exists(mock_ruta))  # Verificamos que el archivo aún existe
})


# Limpiar archivos temporales después de las pruebas
test_that("El archivo temporal se elimina correctamente", {
  # Definir mock_ruta dentro del test
  mock_ruta <- file.path(tempdir(), "NH0046.csv")

  unlink(mock_ruta)  # Elimina el archivo temporal si existe
  expect_false(file.exists(mock_ruta))  # Verificamos que el archivo ya no exista
})
