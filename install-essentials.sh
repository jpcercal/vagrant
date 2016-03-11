#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"install-essentials.sh\"."
echo ""
echo " _____                   _   _       _      "
echo "|  ___|                 | | (_)     | |     "
echo "| |__ ___ ___  ___ _ __ | |_ _  __ _| |___  "
echo "|  __/ __/ __|/ _ \ '_ \| __| |/ _\` | / __| "
echo "| |__\__ \__ \  __/ | | | |_| | (_| | \__ \ "
echo "\____/___/___/\___|_| |_|\__|_|\__,_|_|___/ "
echo "                                            "
echo ""

# Update Apt and Install Essentials
# --------------------
apt-get -y update
apt-get -y install \
    acl \
    build-essential \
    curl \
    git-core \
    htop \
    unzip \
    vim

# Set the timezone
# --------------------
echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Reconfigure Locales
# --------------------
locale-gen en_US en_US.UTF-8 pt_BR pt_BR.UTF-8
dpkg-reconfigure -f noninteractive locales
