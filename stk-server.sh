#!/usr/bin/env bash

STK_CONFIG=${STK_CONFIG:-/stk/config.xml}
MOTD_FILE=${MOTD_FILE:-/stk/motd.txt}
SERVER_NAME=${SERVER_NAME:-STK}

echo "Starting STK server ($SERVER_NAME)..."

if [[ -n ${USERNAME} ]] && [[ -n ${PASSWORD} ]]; then
    supertuxkart --init-user --login=${USERNAME} --password=${PASSWORD}
fi

if [ -f "$STK_CONFIG" ]; then
    echo "Server config is '$STK_CONFIG'"
else
    echo "Server config does not exists: $STK_CONFIG"
    exit 1
fi

if [ -f "$MOTD_FILE" ]; then
    echo "MOTD file is '$MOTD_FILE'"
else
    echo "MOTD file does not exists: $MOTD_FILE"
    exit 1
fi

supertuxkart --server-config=${STK_CONFIG} \
             --wan-server=${SERVER_NAME} \
             --motd=${MOTD_FILE} \
             --xmas=0 \
             --easter=0
