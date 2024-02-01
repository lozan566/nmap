#!/bin/bash

if [ $? -eq 0 ]; then
    read -p "Introduce la IP que quieres escanear: " ip_address

    while true; do
        echo "1) Escaneo rápido y ruidoso"
        echo "2) Escaneo normal"
        echo "3) Escaneo silencioso"
        echo "4) Escaneo de servicios y versiones"
        echo "5) Salir"
        
        read -p "Selecciona una opción: " opcion

        case $opcion in
            1)
                clear
                echo "Escaneando rápido y ruidoso..."
                nmap -min-rate 5000 -T5 -p1-65535 "$ip_address" > rapido.txt &
                echo "Reporte guardado en el fichero rapido.txt"
                ;;
            2)
                clear
                echo "Escaneando normal..."
                nmap -p1-65535 "$ip_address" > normal.txt
                echo "Reporte guardado en el fichero normal.txt"
                ;;
            3)
                clear
                echo "Escaneando silencioso..."
                nmap -sS "$ip_address" > silencioso.txt &
                echo "Reporte guardado en el fichero silencioso.txt"
                ;;
            4)
                clear
                echo "Escaneando servicios y versiones..."
                nmap -sV -sC "$ip_address" > servicios.txt
                echo "Reporte guardado en el fichero servicios.txt"
                ;;
            5)
                echo "Saliendo..."
                exit
                ;;
            *)
                echo "Opción no válida. Por favor, elige una opción válida."
                ;;
        esac
    done
fi
