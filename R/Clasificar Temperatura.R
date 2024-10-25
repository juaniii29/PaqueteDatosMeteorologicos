#' Funcion para clasificar la temperatura
#'
#' La funcion `clasificar_temperatura()`toma una temperatura de grados celisius y la clasifica dependiendo de su magnitud
#'
#' Estos son detalles extra de la funcion
#'
#' @param temp Una temperatura en grados celsius (un vector numerico)
#'
#' @return
#' Una string que clasifica la temperatura ingresada. Los posibles valores son: "Frío", "Templado" y "Caliente"
#'
#' @seealso
#'[convertir_fc()]
#'[convertir_cf()]
#'
#' @examples
#' clasificar_temperatura(21)
#'
#' @export
clasificar_temperatura <- function(temp) {
  ifelse(temp < 15, "Frío",
         ifelse(temp <= 25, "Templado", "Caliente"))
}

