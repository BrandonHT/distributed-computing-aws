#!/bin/bash
# ------------------ PAS0 1: Cambiar separador , por | excepto para las direcciones
# Itera sobre cada archivo
for file in *.csv;
  # Reemplaza todas las comas que no estén dentro de comillas dobles con el carácter '|'
   do csvformat -D '|' "$file" > tmp && mv tmp "$file"; 
   done

# ------------------ PASO 2: Quedarnos solo con los registros de la categoria APARATOS ELECTRICOS
# Crea directorio donde almacenaremos los datos
mkdir ../clean
# en cada archivo, filtra los renglones que pertenezcan a registros de la categoria APARATOS ELECTRICOS
for file in *.csv; do grep -i "APARATOS ELECTRONICOS" "$file" > ../clean/"$file"; done


# ----------------- PASO 3: Cambiar formato de coficiacion utf8 a ASCII
# solo cambia `../clean/` por la ruta donde esten tus datos 
for file in ../clean/*.csv; do
  iconv -f utf8 -t ascii//TRANSLIT "$file" > "$file.temp"
  mv "$file.temp" "$file"
done

# --------------- PASO 4: une todos los csv en uno solo
tail -n+1 -q ../clean/*.csv>> electronics_2021.csv





