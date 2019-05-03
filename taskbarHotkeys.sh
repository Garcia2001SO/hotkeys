#!/bin/bash


contains() {
    [[ $1 =~ $2 ]] && return 0 || return 1
}


app_list=$(wmctrl -lx | awk '{print $3}')
if contains "$app_list" "$1";
    then wmctrl -x -a "$1" ;
    else ("$2"&) ;
fi