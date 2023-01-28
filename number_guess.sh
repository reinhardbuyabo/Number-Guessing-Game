#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER

echo -e "Enter your username: "
read USERNAME

FETCH_USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
echo $FETCH_USER

echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
# GAMES_PLAYED=<total number of games that user has played>
# BEST_GAME=<fewest number of guesses it took that user to win the game>
