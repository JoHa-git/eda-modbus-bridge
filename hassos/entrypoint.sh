#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json
DEVICE="$(bashio::config 'device')"

python3 /app/edamodbusbridge/app.py --httpListenPort 8080 ${DEVICE}