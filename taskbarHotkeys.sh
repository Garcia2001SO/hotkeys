#!/bin/bash


contains() {
    [[ $1 =~ $2 ]] && return 0 || return 1
}


currentDesktop=$(wmctrl -d | awk '$2=="*" {print $1}')
app_list=$(wmctrl -lx | awk -v var="$currentDesktop" '$2==var {print $3}')

if contains "$app_list" "$1";
    then 
        if [ "$2" == "pcmanfm" ];
            then
            apps=$(wmctrl -lx | awk -v var="$currentDesktop" '$2==var {print $1}')
            appId=$(echo $apps | awk -v k="$1" '{print $k}')
            wmctrl -i -a "$appId"
        else wmctrl -x -a "$1"
        fi
    else ("$2"&)
fi