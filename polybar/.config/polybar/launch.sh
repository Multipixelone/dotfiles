#!/usr/bin/env bash

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top & > /dev/null
#polybar bottom & > /dev/null
#polybar bar2 &

echo "Bars launched..."
