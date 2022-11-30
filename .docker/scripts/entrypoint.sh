#!/bin/bash

ALTV_SERVER_LOG_PATH=${ALTV_SERVER_LOG_PATH:-""}
ALTV_SERVER_NO_LOGFILE=${ALTV_SERVER_NO_LOGFILE:-"true"}

/opt/altv/configurator --output-filename server --output-type yaml
mv server.yaml server.cfg
./altv-server --config=/opt/altv/server.cfg $ALTV_SERVER_LOG_PATH $ALTV_SERVER_NO_LOGFILE ${@:1}
