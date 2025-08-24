#!/bin/zsh
brightness=$(brightnessctl get)
max=$(brightnessctl max)

percentage=$((brightness * 100 / max))
total=10
filled=$((percentage * total / 100))
empty=$((total - filled))

bar=$(printf '█%.0s' $(seq 1 $filled))
bar+=$(printf '░%.0s' $(seq 1 $empty))

echo "{\"text\": \"[ $bar ] ${percentage}%\"}"

