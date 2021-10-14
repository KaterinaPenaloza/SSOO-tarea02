#!/bin/bash
#Para usar este script es necesario tener instalado jq
#Procesar el json
curl -s https://api.warframe.market/v1/items |jq -r ".payload.items[] |{id, item_name}" > items.json

#Verificar que se creó el archivo exitosamente
json=items.json
if [ -s "$json" ]; then
	echo "JSON CREADO CON EXITO"
else
	echo "ERROR AL CREAR JSON"
fi

