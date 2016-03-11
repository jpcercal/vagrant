#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"install-npm.sh\"."
echo ""
echo " _   _ _________  ___ "
echo "| \ | || ___ \  \/  | "
echo "|  \| || |_/ / .  . | "
echo "| . \` ||  __/| |\/| |"
echo "| |\  || |   | |  | | "
echo "\_| \_/\_|   \_|  |_/ "
echo "                      "
echo ""

# Get the source code of NPM and install it
# --------------------
cd /usr/local/src/
curl -sS -o node-latest.tar.gz http://nodejs.org/dist/node-latest.tar.gz
tar zxvf node-latest.tar.gz
cd node-*/

./configure
make
make install

npm cache clean
rm -Rf node-*

# Install Bower
# --------------------
npm install -g bower --allow-root

# Install Grunt
# --------------------
npm install -g grunt-cli --allow-root
