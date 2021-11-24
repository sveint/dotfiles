#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $(id -u) -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

PRIMARY_MONITOR=$(polybar -m | grep primary | cut -f1 -d':')
PRIMARY_MONITOR=${PRIMARY_MONITOR:-eDP-1}
echo $PRIMARY_MONITOR
MONITOR=${PRIMARY_MONITOR} polybar -c ~/dotfiles/polybar/config.ini main &
polybar -m | grep -v ${PRIMARY_MONITOR} | cut -f1 -d':' | while read line ; do
   MONITOR=${line} polybar -c ~/dotfiles/polybar/config.ini extra &
done

