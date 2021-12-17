#!/bin/bash

function funcion() {
  { # try
    /bot/BashTelegram/start.sh 'resultadosfutbol'
    echo''
    /bot/BashTelegram/start.sh 'supercell'
    echo''
    /bot/BashTelegram/start.sh 'clashroyale'
    echo''
    /bot/BashTelegram/start.sh 'clashofclans'
    echo''
    sleep 5 # Paramos 10 segundos para esperar el arranque del proceso

    proceso=$(ps -ef | grep -i "resultadosfutbol\|supercell\|clashroyale\|clashofclans" | grep -iv "screen\|grep\|networkd" | wc -l) # Contador para saber si esta corriendo

    if [ $proceso -eq 4 ]; then # Si el contador del proceso es 3 significa que estan corriendo los procesos
      echo 'Arrancado todos los procesos correctamente.'
    else # El contador de procesos no es 3 significa que no esta corriendo
      echo "No se ha arrancado todos los procesos correctamente."
    fi
  } || { # catch
    echo 'Error al arrancar los procesos.'
  }
}

funcion
