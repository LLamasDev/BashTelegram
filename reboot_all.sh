#!/bin/bash

function funcion() {
    { # try
        limpiardead=$(screen -wipe) # Elimino los DEAD
        ./reboot.sh 'supercell'
        echo''
        ./reboot.sh 'clashroyale'
        echo''
        ./reboot.sh 'clashofclans'
        echo''
        sleep 5 # Paramos 5 segundos para esperar el arranque del proceso

        proceso=$(ps -ef | grep -i "supercell\|clashroyale\|clashofclans" | grep -iv "screen\|grep\|networkd" | wc -l) # Contador para saber si esta corriendo

        if [ $proceso -eq 3 ]; then # Si el contador del proceso es 4 significa que estan corriendo los procesos
            echo 'Reiniciado todos los procesos correctamente.'
        else # El contador de procesos no es 3 significa que no esta corriendo
            echo "No se han reiniciado todos los procesos correctamente."
        fi
    } || { # catch
        echo 'Error al reiniciar los procesos.'
    }
}

funcion