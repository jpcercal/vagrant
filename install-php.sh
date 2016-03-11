#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"install-php.sh\"."
echo ""
echo "______ _   _ ______  "
echo "| ___ \ | | || ___ \ "
echo "| |_/ / |_| || |_/ / "
echo "|  __/|  _  ||  __/  "
echo "| |   | | | || |     "
echo "\_|   \_| |_/\_|     "
echo "                     "
echo ""

# Install PHP
# --------------------
add-apt-repository ppa:ondrej/php5-5.6
apt-get -y update
apt-get -y install \
    php5 \
    php5-mhash \
    php5-mcrypt \
    php5-curl \
    php5-cli \
    php5-mysql \
    php5-sqlite \
    php5-gd \
    php5-intl \
    php5-xsl \
    php5-xdebug \
    php-pear \
    php5-imap

php5enmod mcrypt

# Install Composer
# --------------------
curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
