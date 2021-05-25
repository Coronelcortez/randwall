#!/bin/bash
#Seteo variables de tamaño
anchodeseado="1920"
altodeseado="1080"
#Setea el path con las imagenes en una variable
fuente=/home/$USER/Pictures/Wallpapers
cd $fuente
#Limpia los filenames
#for archivo in $(ls *.jpg); do
#    mv $archivo $(echo $archivo | sed -E '\W*(?!\.)\W/')
#Declara y carga archivos del  directorio al array.
declare -a array
for file in *.jpg
do
    imagenes=("${imagenes[@]}" "$file")
done
#Elige una imagen del array de forma aleatoria
wallpaper="${imagenes[$RANDOM % ${#imagenes[@]}]}"
#echo $wallpaper
    #Obtiene medidas de la imagen previamente seleccionada
    ancho=$(identify -format '%w' $wallpaper)
    alto=$(identify -format '%h' $wallpaper)
#echo "La imagen seleccionada tiene $ancho de ancho y $alto de alto"

    if [ $ancho -eq $anchodeseado -a $alto -eq $altodeseado ] ;
        then
        echo "Tenemos fondo de pantalla FullHD $fuente/$wallpaper"
#Setea la imagen seleccionada como wallpaper de forma repetida       
        gsettings set org.cinnamon.desktop.background picture-uri "file://$fuente/$wallpaper" ;
    else 
        echo "No tenemos fondo de pantalla :("
    fi
done