#!/bin/bash
# script for setting up dual screen output
xrandr --output LVDS-1 --auto --primary \
       --output VGA-1  --auto --left-of LVDS-1
