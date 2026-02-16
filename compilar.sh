#!/bin/bash

#Primero hacemos make para compilar todo el programa cuyo main será 'mainMiniC.c'
make all
if [ $? -eq 0 ]; then
    echo "Compilación exitosa."
else
    echo "Error en la compilación."
    exit 1
fi

#Ahora indicamos al usuario que programa tiene que ejecutar

echo "El archivo de salida es 'programalexico'"
echo "Ejecutar './programalexico' y después te pedira introducir el nombre de la entrada"
