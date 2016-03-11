#!/usr/bin/env bash

DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

echo ""
echo "["$(date "$DATE_FORMAT")"] Running the script \"finish.sh\"."
echo ""

# AutRemove
# --------------------
apt-get -y autoremove
