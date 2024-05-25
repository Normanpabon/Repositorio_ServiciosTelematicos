# Configuracion servidor prometheus

## Configuraciones iniciales

Empezamos creando el grupo de prometheus y el usuario correspondiente.

```
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
```

Creamos los directorios donde iran los binarios de prometheus y archivos de configuracion

```
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
```

## Descarga y descompresion de binarios

Descargamos los binarios del repositorio oficial, descomprimimos el tar.gz descargado y nos ubicamos
en el directorio con los binarios.

```
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar vxf prometheus*.tar.gz
cd prometheus*/
```

## Instalacion de binarios

Ahora, estando parados en el directorio, debemos mover los binarios correspondientes a prometheus y promtool 
(sistema de monitoreo opensource con query y tipados propios).
```
sudo mv prometheus /usr/local/bin
sudo mv promtool /usr/local/bin
```

Modificamos la propiedad de los directorios, asignando la propiedad de estos al usuario 'prometheus' y grupo 'prometheus'

```
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
```

Seguimos moviendo los archivos de configuracion y asignando igualmente la propiedad de dichos archivos, al usuario 'prometheus' y grupo 'prometheus'
```
sudo mv consoles /etc/prometheus && sudo mv console_libraries /etc/prometheus && sudo mv prometheus.yml /etc/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus
```

## Configuracion archivo prometheus.yml
El archivo prometheus.yml contiene la configuracion del servicio de prometheus, conteniendo parametros como el intervalo de muestreo, alertas, filtro de reglas y configuracion de jobs para tomar metricas de otros clientes como el node_exporter.

## Configuracion servicio systemd
Systemd es el conjunto de daemons para la administracion del sistema linux, este permite gestionar los servicios requeridos por el sistema.

Con el podemos crear un servicio llamado 'Prometheus' y habilitar el inicio automatico de este, tambien podriamos configurarlo haciendo uso de crontab,
sin embargo systemd nos genera logs de errores de la aplicacion y tiene otras ventajas no listadas aca.

Para eso creamos el archivo "prometheus.service" en la ruta listada a continuacion (el contenido de este archivo se puede referenciar del archivo en este repo con el mismo nombre).
```
sudo nano /etc/systemd/system/prometheus.service
```

Una vez creado el servicio, debemos habilitarlo e iniciarlo. Al habilitarlo nos aseguramos que se inicie automaticamente.

```
sudo systemctl enable prometheus
sudo systemctl start prometheus
```

podemos verificar el estado del servicio con systemctl
```
sudo systemctl status prometheus
```

## Acceder a interfaz de prometheus
Para acceder a la interfaz de prometheus debemos acceder al puerto 9090 de nuestra maquina. tal que "http://IpServidorPrometheus:9090"
