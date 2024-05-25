# Como desplegar

## Montaje de los contenedores con docker compose

estando parado sobre esta carpeta con cd, usamos el siguiente comando

```
sudo docker compose up -d
```

Esperamos de 1 a 5 minutos a que docker realice pull de las dependencias y
el contenedor de python realice la instalacion de las librerias necesarias
con pip

Podemos revisar el estado de los contenedores con el comando

```
sudo docker ps
```


## Accediendo al servicio

Para ingresar a la aplicacion, usamos la ip de nuestra maquina con el puerto 5000
tal que : 127.0.0.1:5000
(remplazar la ip local por la ip de tu maquina)
