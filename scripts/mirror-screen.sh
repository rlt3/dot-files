#!/bin/bash
# script for setting mirroring screen output with automatic scaling
xrandr --output VGA-1  --auto --primary \
      --same-as LVDS-1 --auto --scale-from 1366x768
