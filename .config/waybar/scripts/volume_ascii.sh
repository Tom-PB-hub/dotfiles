#!/bin/zsh
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1 | tr -d '%')
total=10
filled=$((vol * total / 100))
empty=$((total - filled))

bar=$(printf '█%.0s' $(seq 1 $filled))
bar+=$(printf '░%.0s' $(seq 1 $empty))

echo "{\"text\": \"[ $bar ] ${vol}%\"}"

