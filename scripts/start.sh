#!/bin/bash
config=/mattermost/config.json

DB_HOST=${DB_HOST:-db}
DB_PORT=${DB_PORT:-3306}
DB_TYPE=${DB_TYPE:-mysql}
DB_USER=${DB_USER:-mattermost}
DB_PASS=${DB_PASS:-mm_password}
DB_NAME=${DB_NAME:-mattermost}

GMAIL_ADDRESS=${GMAIL_ADDRESS}
GMAIL_PASSWORD=${GMAIL_PASSWORD}

echo -ne "Configure database and email settings"
if [ ! -f $config ]
then
    cp /config.template.json $config
    sed -Ei "s/DB_HOST/$DB_HOST/" $config
    sed -Ei "s/DB_PORT/$DB_PORT/" $config
    sed -Ei "s/DB_USER/$DB_USER/" $config
    sed -Ei "s/DB_PASS/$DB_PASS/" $config
    sed -Ei "s/DB_NAME/$DB_NAME/" $config
    echo OK
else
    echo SKIP
fi

echo "Wait until database is ready..."
until nc -z $DB_HOST $DB_PORT
do
    sleep 1
done

# Wait to avoid "panic: Failed to open sql connection the database system is starting up"
sleep 1

echo "Starting mattermost"
cd /opt/mattermost/bin
./platform
