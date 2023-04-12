#!/bin/bash

# Para ejecutar este programa, necesitas posicionarte en el directorio donde estan almacenados tus datos

# Crea directorio donde almacenaremos los datos limpios
mkdir ../clean
# Crea archivo donde escribiremos los datos
touch ../clean/electronics_2021.csv
# VARIABLE
PATH_DATACLEAN=$(../clean/electronics_2021.csv)

# --------------- PASO 1: une todos los csv en uno solo
tail -n+1 -q *.csv >> $PATH_DATACLEAN


# ------------------ PAS0 2: Cambiar separador , por | excepto para las direcciones
  # Reemplaza todas las comas que no estén dentro de comillas dobles con el carácter '|'
csvformat -D '|' $PATH_DATACLEAN > tmp && mv tmp "$PATH_DATACLEAN"

# ------------------ PASO 3.1: Quedarnos solo con los registros de la categoria APARATOS ELECTRICOS
# ----------------- PASO 3.2: Cambiar formato de coficiacion utf8 a ASCII

grep -i "APARATOS ELECTRONICOS" $PATH_DATACLEAN > $PATH_DATACLEAN < iconv -f utf8 -t ascii//TRANSLIT > "$PATH_DATACLEAN.temp"
mv "$file.temp" "$file"




