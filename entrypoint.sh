#!/bin/bash

MLDONKEY_ADMIN_PASSWORD=${MLDONKEY_ADMIN_PASSWORD-password}

# Initialisation of mldonkey
if [ ! -f /var/lib/mldonkey/downloads.ini ]; then
    mldonkey &
    echo "Waiting for mldonkey to start..."
    sleep 5
    /usr/lib/mldonkey/mldonkey_command -p "" "set allowed_ips 0.0.0.0/0" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "useradd admin $MLDONKEY_ADMIN_PASSWORD"
    /usr/lib/mldonkey/mldonkey_command -u admin -p "$MLDONKEY_ADMIN_PASSWORD" "kill"
fi

mldonkey
