#!/bin/bash
vpn_name=$(nmcli -t -f NAME,TYPE connection show --active | grep ':vpn' | cut -d: -f1)

if [ -n "$vpn_name" ]; then
  echo " $vpn_name"
else
  echo ""
fi
