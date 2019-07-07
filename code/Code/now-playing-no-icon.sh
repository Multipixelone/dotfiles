#!/usr/bin/env bash

MPD_HOST="musicbox"

if ! mpc >/dev/null 2>&1; then
  echo no mpd
  exit 1
elif mpc status | grep -q playing; then
  ( zscroll -n -u -b "x" -d 0.5 -l 50 -M "mpc status" -m "playing" -b " " -s 1 -m "paused" -b " " -s 0 "mpc current" ) &
else
  echo  no song
fi
# Block until an event is emitted
mpc idle >/dev/null
