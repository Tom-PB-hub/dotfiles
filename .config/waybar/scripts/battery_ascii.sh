#!/bin/zsh


battery_path=$(find /sys/class/power_supply/ -maxdepth 1 -name 'BAT*' | head -n 1)

if [[ -z "$battery_path" ]]; then
  echo '{"text": "[ NO BATTERY ]"}'
  exit 0
fi

capacity=$(cat "$battery_path/capacity")
total=10
filled=$((capacity * total / 100))
empty=$((total - filled))

bar=$(printf '█%.0s' $(seq 1 $filled))
bar+=$(printf '░%.0s' $(seq 1 $empty))

# Choix de la couleur en fonction du niveau de batterie
if (( capacity < 15 )); then
  color="#FF0000"  # rouge si batterie faible
else
  color="#00FF00"  # vert matrix
fi

echo "{\"text\": \"[ $bar ] ${capacity}%\"}"
