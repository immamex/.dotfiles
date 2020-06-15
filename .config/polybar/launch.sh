#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload panel &
  done
else
  polybar --reload panel &
fi
# Launch bar1 and bar2
#polybar bottom >>/tmp/polybar2.log 2>&1 &

echo "Bars launched..."
