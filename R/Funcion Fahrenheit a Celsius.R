#' De fahrenheit a celsius
#'
#' La funcion `convertir_fc()` pasa de grados fahrenheit a celsius
#'
#' @param temp_fahrenheit un vector numerico
#'
#' @return
#' Un vector numérico en grados Celsius
#'
#' @seealso
#' [convertir_cf()]
#'
#' @examples
#' convertir_fc(c(0, 32, 100))
#'
#'
#' @export
convertir_fc <- function(temp_fahrenheit) {
  if (!is.numeric(temp_fahrenheit)) {
    cli::cli_abort("El argumento temp_fahrenheit debe ser numérico. La variable ingresada es un {class(temp_fahrenheit)[1]}")
  }
  (temp_fahrenheit - 32) * 5 / 9
}
