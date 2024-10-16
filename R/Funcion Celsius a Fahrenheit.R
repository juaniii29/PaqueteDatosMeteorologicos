#' Funcion para convertir grados celsius a grados fahrenheit
#'
#' La funcion `convertir_cf()` toma una temperatura en grados celsius y la convierte a grados fahrenheit
#'
#' Estos son detalles extra de la funcion
#'
#' @param temp_centigrados Una temperatura en grados celsius (un vector numerico)
#'
#' @return
#' Un vector numerico en grados fahrenheit
#'
#'@seealso
#' [convertir_fc()]
#'
#' @examples
#'
#' convertir_cf(25)
#' convertir_cf(10)
#'
#' @export
convertir_cf <- function(temp_celsius) {
  if (!is.numeric(temp_celsius)) {
    cli::cli_abort("El argumento temp_celsius debe ser numérico. La variable ingresada es un {class(temp_celsius)[1]}")
  }
  (temp_celsius * 9/5) + 32
}
