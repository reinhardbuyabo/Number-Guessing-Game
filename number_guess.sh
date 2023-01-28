#!/bin/bash

RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER

echo -e "Enter your username: "
read USERNAME

