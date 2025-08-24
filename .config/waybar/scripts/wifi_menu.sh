#!/bin/bash

# Récupérer la liste des réseaux
NETWORKS=$(nmcli -t -f SSID,SIGNAL,SECURITY device wifi list | awk -F: 'NR>1 {print $1 "  (" $2 "%)  [" $3 "]"}' | sort -u)

# Afficher dans rofi
#CHOSEN=$(echo -e "$NETWORKS" | wofi --dmenu --prompt="Wi-Fi" --width=400 --height=300)
CHOSEN=$(echo -e "$NETWORKS" | rofi -dmenu -p "Wi-Fi" -theme-str 'window {width: 400px;} listview {lines: 10;}')

# Récupérer juste le SSID
SSID=$(echo "$CHOSEN" | sed 's/  (.*//')

# Si rien n'est choisi, quitter
[ -z "$SSID" ] && exit 0

# Tenter la connexion
nmcli device wifi connect "$SSID" || notify-send "Wi-Fi" "Connexion échouée à $SSID"
