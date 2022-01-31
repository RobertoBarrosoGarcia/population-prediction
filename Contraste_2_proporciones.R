# Importacion de librerias
library(readr)
library(dplyr)

# Importacion de los datos
Datos_abandono <- read_delim("Datos_abandono.csv", 
                             ";", escape_double = FALSE, trim_ws = TRUE)

# Calculo del numero de individuos del estudio
Datos_abandono %>% filter( CCAA %in% "Madrid")->Datos_Madrid
Datos_abandono %>% filter( CCAA %in% "Barcelona")->Datos_Barcelona

n1 = nrow(Datos_Madrid)
n2 = nrow(Datos_Barcelona)

# Calculo del numero de individuos que han abandonado
Datos_Madrid %>% filter( ABANDONO %in% "Si")->Datos_Madrid_si
Datos_Barcelona %>% filter( ABANDONO %in% "Si")->Datos_Barcelona_si

x1 = nrow(Datos_Madrid_si)
x2 = nrow(Datos_Barcelona_si)

# Proporciones
P1 = x1/n1
P2 = x2/n2

# P: Proporción conjunta
P = (n1*P1+n2*P2)/(n1+n2)

# Zexp: Calificación Z
Zexp = (P1-P2)/sqrt(P*(1-P)*(1/n1+1/n2))
pvalor = pnorm(Zexp)

# Cálculo de límites
alpha = 0.02
lim_region = qnorm(alpha)