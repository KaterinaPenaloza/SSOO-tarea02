# SSOO-tarea02
Autor: Katerina Peñaloza Caballería <br/>
Correo: katerina.penaloza@alumnos.uv.cl

## Trabajo realizado:
Se ha solicitado implementar un script en **BASH** que permita obtener los datos de los ítems del juego llamado *Warframe* del servidor **REST** que dispone el videojuego. Una vez obtenidos, estos datos se deberán organizar en un archivo **JSON** utilizando *cURL*, redireccionamiento y *jq*. <br/>
Los datos se obtendrán del siguiente enlace: https://api.warframe.market/v1/items <br/>
En primer lugar, con el comando `curl`, se extraerán los datos del enlace mencionado y serán redireccionados con el comando `>` a un archivo llamado **items.json**. Los datos obtenidos serán: id, url_name, thumb e item_name. <br/>
Para esto, tal como se vio en clases, utilizaremos la siguiente secuencia de comandos en Linux: <br/>
`curl -s https://api.warframe.market/v1/items > items.json`  (se usó la opción *-s* para que no se muestre el proceso en la consola) <br/>
Sin embargo, al ver lo que hay en este archivo con el comando `cat`, se muestra por pantalla todo el contenido del .json, pero de una forma en la que no se puede ver ordenadamente ni procesar. Por lo tanto, con el comando `jq`, podremos visualizar mejor el contenido de este archivo. <br/> 
Para saber más acerca del comando *jq*, nos ayudamos con su [manual](https://stedolan.github.io/jq/manual/) y unos ejemplos mostrados en [LZone](https://lzone.de/cheat-sheet/jq) lo que luego de investigar y hacer pruebas, nos resulta en el siguiente código: <br/>
`jq -r ".payload.items[] |{id, item_name}" > items.json` <br/>
En donde:
- `-r` indica un *raw-output*, para que en resumen, se vea más ordenado.
- `".payload.items[]` extraemos la lista de items.
- `|{id, item_name}"` extraemos el *id* y el *item_name* de la lista de items
- `> items.json` redireccionamos la salida al archivo items.json <br/>

Por lo que finalmente el script todo unido queda de la siguiente manera: <br/>
`curl -s https://api.warframe.market/v1/items |jq -r ".payload.items[] |{id, item_name}" > items.json`

Luego, para confirmar que el script se ejecutó correctamente:
```
json=items.json
if [ -s "$json" ]; then
	echo "JSON CREADO CON EXITO"
else
	echo "ERROR AL CREAR JSON"
fi
```
Si el archivo fue creado correctamente, es decir, existe en el directorio y tiene contenido, se mostrará en la consola el mensaje de que se creó correctamente, esto con ayuda de `-s`, consultado en el manual de bash, sección *conditional expressions*, que indica si un archivo existe y su tamaño es mayor a cero.
De lo contrario, si hubo un error en la ejecución del script, saldrá un mensaje de error.

## Modo de uso
1. Asegurarse de tener instalado jq y tener los permisos de usuario con `chmod`
2. Ejecutar el script con el comando `./script.sh`
3. Verificar que se creó el archivo exitosamente con `ls`
4. Ver el contenido con el comando `jq ‘.’ items.json `
