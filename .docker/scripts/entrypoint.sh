#!/bin/bash

ALTV_SERVER_LOG_PATH=${ALTV_SERVER_LOG_PATH:-""}
ALTV_SERVER_NO_LOGFILE=${ALTV_SERVER_NO_LOGFILE:-"true"}

/opt/altv/configurator create --output server.toml
./altv-server --config=/opt/altv/server.toml $ALTV_SERVER_LOG_PATH $ALTV_SERVER_NO_LOGFILE ${@:1}
