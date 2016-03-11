#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"enable-sites.sh\"."
echo ""
echo " _____            _     _        _____ _ _              "
echo "|  ___|          | |   | |      /  ___(_) |             "
echo "| |__ _ __   __ _| |__ | | ___  \ \`--. _| |_ ___  ___  "
echo "|  __| '_ \ / _\` | '_ \| |/ _ \  \`--. \ | __/ _ \/ __|"
echo "| |__| | | | (_| | |_) | |  __/ /\__/ / | ||  __/\__ \  "
echo "\____/_| |_|\__,_|_.__/|_|\___| \____/|_|\__\___||___/  "
echo "                                                        "
echo ""

# Replace contents of default Apache vhost
# --------------------
rm -Rf /etc/apache2/sites-available
rm -Rf /etc/apache2/sites-enabled/*
ln -s /home/vagrant/sites-available /etc/apache2/sites-available

SITES=/etc/apache2/sites-available/*.conf
for SITE in $SITES
do
    filename=$(basename "$SITE")
    a2ensite ${filename%.*}
done

service apache2 restart
