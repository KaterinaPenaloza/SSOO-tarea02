# SSOO-tarea02
Autor: Katerina Peñaloza Caballería <br/>
Correo: katerina.penaloza@alumnos.uv.cl

## Trabajo realizado:
Se ha solicitado implementar un script en **BASH** que permita obtener los datos de los ítems del juego llamado *Warframe* del servidor **REST** que dispone el videojuego. Una vez obtenidos, estos datos se deberán organizar en un archivo **JSON** utilizando *cURL*, redireccionamiento y *jq*. <br/>
Los datos se obtendrán del siguiente enlace: https://api.warframe.market/v1/items <br/>
En primer lugar, con el comando ``curl``, se extraerán los datos del enlace mencionado y serán redireccionados con el comando ``>`` a un archivo llamado **items.json**. Los datos obtenidos serán: id, url_name, thumb e item_name. <br/>
Para esto, tal como se vio en clases, utilizaremos la siguiente secuencia de comandos en Linux: <br/>
``curl -s https://api.warframe.market/v1/items > items.json``  (se usó la opción *-s* para que no se muestre el proceso en la consola) <br/>
Sin embargo, al ver lo que hay en este archivo con el comando ``cat``, se muestra por pantalla todo el contenido del .json, pero de una forma en la que no se puede ver ordenadamente ni procesar. Por lo tanto, con el comando `jq`, podremos visualizar mejor el contenido de este archivo. <br/> 
Para saber más acerca del comando *jq*, nos ayudamos con su [manual](https://stedolan.github.io/jq/manual/) y con unos ejemplos mostrados en [LZone](https://lzone.de/cheat-sheet/jq) <br/>

``curl -s https://api.warframe.market/v1/items |jq -r ".payload.items[] |{id, item_name}" > items.json``
