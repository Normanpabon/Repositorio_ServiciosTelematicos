# Configuracion de la maquina corriendo la app web

## Instalacion de node exporter
Descargamos el binario de node exporter, desde la url:
"https://prometheus.io/download/#node_exporter"

Una vez descargado, descomprimimos el archivo con el comando 

```
tar xvfz node_exporter-...-.tar.gz
```
podemos ejecutar el node_exporter situandonos en la carpeta descomprimida
y escribiendo. 

```
./node_exporter
```

Sin embargo, tener la consola ocupada corriendo ese binario es poco optimo,
por lo que debemos automatizar esta tarea.

## Creacion de tarea programada con crontab

Crontab nos permite automatizar la ejecucion de comandos o tareas cada x tiempo,
n veces al dia o bien bajo unos parametros que definamos.

Para este caso, vamos a indicar que nos ejecute node_explorer cada vez que se encienda la
maquina, esperando 1 minuto previamente, para dar tiempo a que resuelva la ip y empiecen 
los otros servicios necesarios.


```
sudo crontab -e
```

nos preguntara que editor usaremos, escogemos nano y dentro del documento que nos abra
escribimos lo siguiente, para finalizar guardando cambios.
```
@reboot sleep 60 && /path_donde_esta_node_exporter/node_exporter
```

podemos verificar la ejecucion del node exporter en la direccion http://ipMaquina:9100