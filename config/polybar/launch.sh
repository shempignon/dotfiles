#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -m | sed s/:.*// | tac | while read -r monitor
do 
  monitor=$monitor polybar -q main -c "$DIR"/config.ini &
done

