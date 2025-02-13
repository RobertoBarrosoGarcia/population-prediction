# Importacion de librerias
library(readr)
library(dplyr)

# Importacion de los datos
Datos_edades <- read_delim("edades.csv", 
                             ";", escape_double = FALSE, trim_ws = TRUE)

# Media oficial en Espa�a
media_oficial = 31

# Construccion de los datos
tot_muestras = nrow(Datos_edades)
x = c(Datos_edades[["Edad"]])
media = mean(x)
varianza = var(x)

# C�lculo de l�mites
alpha = 0.01
lim_region = abs(qnorm(alpha/2))

# Zexp: Calificaci�n Z
Zexp = (media-media_oficial)/sqrt(varianza/tot_muestras)
pvalor = pnorm(Zexp)

# Zona de aceptaci�n
lim_abajo = media_oficial-lim_region*varianza/sqrt(tot_muestras)
lim_arriba = media_oficial+lim_region*varianza/sqrt(tot_muestras)