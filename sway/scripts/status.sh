bat=$(cat /sys/class/power_supply/BAT0/capacity)
date=$(date +"%a, %B %d | %I:%M:%S %p")
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

echo "$vol | $date | $bat"
