#' De fahrenheit a celsius
#'
#' La funcion `convertir_fc()` toma una temperatura en grados fahrenheit y la convierte a grados celsius
#'
#' Estos son detalles extra de la funcion
#'
#' @param temp_fahrenheit Una temperatura en grados fahrenheit (un vector numerico)
#'
#' @return Un vector numérico en grados Celsius
#'
#' @seealso
#' [convertir_cf()]
#' [clasificar_temperatura()]
#'
#' @examples
#' convertir_fc(33)
#'
#'
#' @export
convertir_fc <- function(temp_fahrenheit) {
  if (!is.numeric(temp_fahrenheit)) {
    cli::cli_abort("El argumento temp_fahrenheit debe ser numerico. La variable ingresada es un {class(temp_fahrenheit)[1]}")
  }
  (temp_fahrenheit - 32) * 5 / 9
}

