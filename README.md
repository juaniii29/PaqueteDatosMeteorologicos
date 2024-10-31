
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PaqueteAgrometeorologico

<!-- badges: start -->
<!-- badges: end -->

El objetivo del PaqueteAgrometeorologico es brindar herramientas al
usuario en base a funciones, para que pueda trabajar de manera mas
eficiente en el ambito meteorologico.

## Instalacion

You can install the development version of PaqueteAgrometeorologico from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("juaniii29/PaqueteDatosMeteorologicos")
```

## Funciones

*`convertir_cf()`*: Toma un valor numerico en grados celsius y lo
convierte a grados fahrenheit *`convertir_fc()`*: Toma un valor numerico
en grados fahrenheit y lo convierte a grados celsius
*`clasificar_temperatura()`*: Toma un valor numerico en grados celsius y
lo clasifica dependiendo de su magnitud

## Example

Este es un ejemplo basico en el que se muestra una de las tantas
funciones del paquete:

``` r
library(PaqueteAgrometeorologico)
convertir_fc(c(0, 32, 100))
#> [1] -17.77778   0.00000  37.77778
```
