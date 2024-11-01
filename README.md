
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PaqueteAgrometeorologico
<img src="man/figures/logo.png" alt="PaqueteAgrometeorologico" align="right" style="float: right; margin-left: 10px;" width="150"/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

El objetivo del PaqueteAgrometeorologico es brindar herramientas al
usuario en base a funciones, para que pueda trabajar de manera mas
eficiente en el ambito meteorologico.

## Instalacion

Puedes instalar la versión de desarrollo de PaqueteAgrometeorológico
desde [GitHub](https://github.com/) con:

``` r
# install.packages("pak")
pak::pak("juaniii29/PaqueteDatosMeteorologicos")
```

## Funciones

*`convertir_cf()`*: Toma un valor numerico en grados celsius y lo
convierte a grados fahrenheit.

*`convertir_fc()`*: Toma un valor numerico en grados fahrenheit y lo
convierte a grados celsius.

*`clasificar_temperatura()`*: Toma un valor numerico en grados celsius y
lo clasifica dependiendo de su magnitud.

*`tabla_resumen_temperatura()`*: Toma un dataset con informacion sobre
estaciones meteorologicas y devuelve un resumen. sobre este.

*`grafico_temperatura()`*: Toma un dataset con informacion sobre
estaciones meteorologicas y devuelve un grafico de la temperatura media
mensual por estación.

## Example

Este es un ejemplo basico en el que se muestra una de las tantas
funciones del paquete:

``` r
library(PaqueteAgrometeorologico)
convertir_fc(c(0, 32, 100))
#> [1] -17.77778   0.00000  37.77778
```
