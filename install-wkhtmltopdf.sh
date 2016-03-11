#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"install-wkhtmltopdf.sh\"."
echo ""
echo "          _    _     _             _ _                  _  __   "
echo "         | |  | |   | |           | | |                | |/ _|  "
echo "__      _| | _| |__ | |_ _ __ ___ | | |_ ___  _ __   __| | |_   "
echo "\ \ /\ / / |/ / '_ \| __| '_ \` _ \| | __/ _ \| '_ \ / _\` |  _|"
echo " \ V  V /|   <| | | | |_| | | | | | | || (_) | |_) | (_| | |    "
echo "  \_/\_/ |_|\_\_| |_|\__|_| |_| |_|_|\__\___/| .__/ \__,_|_|    "
echo "                                             | |                "
echo "                                             |_|                "
echo ""

# Install wkhtmltopdf
# --------------------
apt-get install -y xfonts-75dpi
curl -sS -o wkhtmltopdf.deb http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
dpkg -i wkhtmltopdf.deb
rm wkhtmltopdf.deb
