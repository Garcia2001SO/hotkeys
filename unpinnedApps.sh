#!/bin/bash

keyNumber=$1

#filter desktop list for second row == *
currentDesktop=$(wmctrl -d | awk '$2=="*" {print $1}')
app_list=$(wmctrl -lx | awk -v var="$currentDesktop" '$2==var {print $1}')

appId=$(echo $app_list | awk -v k="$keyNumber" '{print $k}')

#focus app in keynumber position
#this focus the window
#the argument has to be the window's id
wmctrl -i -a "$appId"