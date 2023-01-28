#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER

echo -e "Enter your username: "
read USERNAME

FETCH_USER=$($PSQL "SELECT * FROM number_guess WHERE username='$USERNAME'")

