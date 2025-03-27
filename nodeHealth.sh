#!/bin/bash

##############################
# Author: Emmanuel
# Date: 26/03/2025
#
# This script outputs the node health
#
# Version: v1
##############################

echo "Print the disc space."
df -h

echo "Print the memory."
free -g

echo "Print the resources"
nproc
