#!/usr/bin/bash

PAIVA=$(date +"%Y-%m-%d")
AIKA=$(date +"%H:%M")
GROUP=$(id -gn)

echo " "
echo "Tervehdys $USER"
echo "Tänään on $PAIVA ja kello on $AIKA."
echo "Olet käyttäjäryhmään '$GROUP' kuuluva käyttäjä."
echo " "
echo "Reititystaulusi näyttää tältä:"
ip route
echo " "
echo "IPv4-osoitteesi on:"
ip addr show | grep -e inet
echo " "
echo "ja IPv6-osoitteesi on:"
ip addr show | grep -e inet6
echo " "
