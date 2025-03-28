#!/bin/bash

##############################
# Author: Emmanuel
# Date: 26/03/2025
#
# This script outputs the node health
#
# Version: v1
##############################

set -x # debug mode
set -e # exits the script when there's error
set -o # pipefail

df -h

free -g

nproc

ps -ef | grep amazon | awk -F" " '{print $2}'
