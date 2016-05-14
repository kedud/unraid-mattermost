#!/bin/bash

# exit script if return code != 0
set -e

if [ -z "$DB_HOST" ]; then
    echo "Need to set DB_HOST"
    exit 1
fi  

config=/mattermost/config.json

DB_HOST=${DB_HOST}
DB_PORT=${DB_PORT:-3306}
DB_USER=${DB_USER:-mattermost}
DB_PASS=${DB_PASS:-mm_password}
DB_NAME=${DB_NAME:-mattermost}

GMAIL_ADDRESS=${GMAIL_ADDRESS}
GMAIL_PASSWORD=${GMAIL_PASSWORD}

echo -ne "Configure database and email settings\n"
if [ ! -f $config ]
then
    cp /config.template.json $config
    sed -Ei "s/DB_HOST/$DB_HOST/" $config
    sed -Ei "s/DB_PORT/$DB_PORT/" $config
    sed -Ei "s/DB_USER/$DB_USER/" $config
    sed -Ei "s/DB_PASS/$DB_PASS/" $config
    sed -Ei "s/DB_NAME/$DB_NAME/" $config
    sed -Ei "s/GMAIL_ADDRESS/$GMAIL_ADDRESS/" $config
    sed -Ei "s/GMAIL_PASSWORD/$GMAIL_PASSWORD/" $config
    echo OK
else
    echo SKIP
fi

echo "Starting mattermost"
cd /opt/mattermost/bin
./platform -config="/mattermost/config.json"
