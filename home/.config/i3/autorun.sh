#!/usr/bin/env bash

function run {
  if ! pgrep "$1"; then
    $@&
  fi
}

run feh --bg-scale "$HOME/.config/i3/background.jpg"
run compton -c -b --inactive-dim 0.7 --no-fading-openclose --inactive-dim-fixed
run dex -a -e XFCE
run pasystray --volume-max=100 --volume-inc=5 --notify=all
run mpDris2 --music-dir="$HOME/Музыка"
