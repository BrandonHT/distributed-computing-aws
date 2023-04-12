#!/bin/bash

# Lee el nombre del archivo como argumento
filename=$1

# Itera sobre cada archivo
for file in *.csv;
  # Reemplaza todas las comas que no estén dentro de comillas dobles con el carácter '|'
   do csvformat -D '|' "$file" > tmp && mv tmp "$file"; 
   done
