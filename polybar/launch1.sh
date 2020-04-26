#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar work1 -c $HOME/.config/polybar/configg.ini &
polybar work2 -c $HOME/.config/polybar/configgg.ini &
polybar work -c $HOME/.config/polybar/configggg.ini &
#polybar back -c $HOME/.config/polybar/configg.ini &

