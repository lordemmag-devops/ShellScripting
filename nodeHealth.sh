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
df -h

free -g

nproc
