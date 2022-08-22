#!/usr/bin/env bash

STK_CONFIG=${STK_CONFIG:-/stk/config.xml}
EXTRA_ARGS=()

echo "Starting STK server..."

if [[ -n $STK_USER ]] && [[ -n $STK_PASSWORD ]]; then
    supertuxkart --init-user --login="$STK_USER" --password="$STK_PASSWORD"
fi

if [ -f "$STK_CONFIG" ]; then
    echo "Server config is '$STK_CONFIG'"
else
    echo "Server config does not exists: $STK_CONFIG"
    exit 1
fi

if [ -n "$STK_SERVER_NAME" ]; then
    EXTRA_ARGS+=(--wan-server="${STK_SERVER_NAME}")
fi

if [ -n "$STK_MOTD" ]; then
    EXTRA_ARGS+=(--motd="$STK_MOTD")
fi

supertuxkart --server-config="$STK_CONFIG" \
             --xmas=0 \
             --easter=0 \
             "${EXTRA_ARGS[@]}"
