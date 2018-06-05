#!/bin/bash
# script for setting up dual screen output
xrandr --output LVDS1 --auto --primary \
       --output VGA1  --auto --left-of LVDS1
