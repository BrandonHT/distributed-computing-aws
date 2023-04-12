#!/bin/bash

# Itera sobre cada archivo
for file in *.csv;
  # Reemplaza todas las comas que no estén dentro de comillas dobles con el carácter '|'
   do csvformat -D '|' "$file" > tmp && mv tmp "$file"; 
   done

# ------------------------------------Quedarnos solo con los registros de la categoria APARATOS ELECTRICOS
# Crea directorio donde almacenaremos los datos
mkdir ../clean
# en cada archivo, filtra los renglones que pertenezcan a registros de la categoria APARATOS ELECTRICOS
for file in *.csv; do grep -i "APARATOS ELECTRONICOS" "$file" > ../clean/"$file"; done

# solo cambia `../clean/` por la ruta donde esten tus datos 
for file in ../clean/*.csv; do
  iconv -f utf8 -t ascii//TRANSLIT "$file" > "$file.temp"
  mv "$file.temp" "$file"
done

# une todos los csv en uno solo
tail -n+1 -q ../clean/*.csv>> electronics_2021.csv





