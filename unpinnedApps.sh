#!/bin/bash

app_list=$(wmctrl -lx | awk '{print $3}')

#filter app_list for second row == 0