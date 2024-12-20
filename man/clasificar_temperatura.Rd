% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Clasificar_Temperatura.R
\name{clasificar_temperatura}
\alias{clasificar_temperatura}
\title{Funcion para clasificar la temperatura}
\usage{
clasificar_temperatura(temp)
}
\arguments{
\item{temp}{Una temperatura en grados celsius (un vector numerico)}
}
\value{
Una string que clasifica la temperatura ingresada. Los posibles valores son: "Frio", "Templado" y "Caliente"
}
\description{
La funcion \code{clasificar_temperatura()}toma una temperatura de grados celisius y la clasifica dependiendo de su magnitud
}
\details{
Estos son detalles extra de la funcion
}
\examples{
clasificar_temperatura(21)

}
\seealso{
\code{\link[=convertir_fc]{convertir_fc()}}
\code{\link[=convertir_cf]{convertir_cf()}}
}
