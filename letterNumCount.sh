#!/bin/bash

echo -n "Enter a word: "
read word
echo "$word" | tr -cd 's' | wc -c
