#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"install-apache.sh\"."
echo ""
echo "  ___                   _            "
echo " / _ \                 | |           "
echo "/ /_\ \_ __   __ _  ___| |__   ___   "
echo "|  _  | '_ \ / _\` |/ __| '_ \ / _ \ "
echo "| | | | |_) | (_| | (__| | | |  __/  "
echo "\_| |_/ .__/ \__,_|\___|_| |_|\___|  "
echo "      | |                            "
echo "      |_|                            "
echo "                                     "
echo ""

# Ignore the post install questions
export DEBIAN_FRONTEND=noninteractive

# Install Apache
# --------------------
apt-get install -y apache2 libapache2-mod-php5

# Install ModSecurity
# --------------------
apt-get install -y libapache2-mod-security2

MODSEC=$(cat <<EOF
<IfModule security2_module>
    SecRuleEngine on
    ServerTokens Full
    SecServerSignature "Web Server/1.0"
</IfModule>

EOF
)
echo "$MODSEC" >> /etc/apache2/apache2.conf

# Delete default apache web dir
# --------------------
rm -Rf /var/www/html
rm -Rf /etc/apache2/sites-available/
rm -Rf /etc/apache2/sites-enabled/*

# Enable Modules
# --------------------
a2enmod security2
a2enmod rewrite
