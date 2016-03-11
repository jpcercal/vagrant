#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"install-mysql.sh\"."
echo ""
echo "___  ___      _____  _____ _      "
echo "|  \/  |     /  ___||  _  | |     "
echo "| .  . |_   _\ \`--. | | | | |    "
echo "| |\/| | | | |\`--. \| | | | |    "
echo "| |  | | |_| /\__/ /\ \/' / |____ "
echo "\_|  |_/\__, \____/  \_/\_\_____/ "
echo "         __/ |                    "
echo "        |___/                     "
echo ""

# Ignore the post install questions
export DEBIAN_FRONTEND=noninteractive

# Install MySQL
# --------------------
apt-get -y install \
    mysql-server-5.5 \
    mysql-client-5.5
