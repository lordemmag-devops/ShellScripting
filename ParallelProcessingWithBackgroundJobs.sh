#!/bin/bash

echo "Starting tasks..."

sleep 5 &   # Run first task in the background
PID1=$!

sleep 3 &   # Run second task
PID2=$!

wait $PID1 $PID2  # Wait for both tasks to complete

echo "All tasks completed!"

