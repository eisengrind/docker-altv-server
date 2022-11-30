#!/bin/bash

ALTV_SERVER_LOG_PATH=${ALTV_SERVER_LOG_PATH:-""}
ALTV_SERVER_NO_LOGFILE=${ALTV_SERVER_NO_LOGFILE:-"true"}

/opt/altv/configurator create --output server.cfg
./altv-server --config=/opt/altv/server.cfg $ALTV_SERVER_LOG_PATH $ALTV_SERVER_NO_LOGFILE ${@:1}
