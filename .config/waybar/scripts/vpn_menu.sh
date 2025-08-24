#! /usr/bin/bash

VPN_LIST=$(nmcli -t -f NAME,TYPE connection show | grep ":vpn" | cut -d: -f1)

CHOICE=$(echo $VPN_LIST | rofi -dmenu -sep " " -p "VPN" -theme-str 'window {width: 250px;} listview {lines: 5;}')

if [ -n $CHOICE ]; then
    ACTIVE=$(nmcli -t -f NAME,TYPE connection show --active | grep ":vpn" |  cut -d: -f1)
    nmcli connection down $ACTIVE
    nmcli connection up $CHOICE
fi
