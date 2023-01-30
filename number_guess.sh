#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESSES=1
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

echo -e "Enter your username: "
read USERNAME

FETCH_USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")

if [[ -z $FETCH_USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS

  # GUESS
  until [[ $USER_GUESS -eq $RANDOM_NUMBER ]]
  do
  ((GUESSES++))
    if [[ $USER_GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        read USER_GUESS
      elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:" 
        read USER_GUESS
      fi
    else
      echo "That is not an integer, guess again:"
      read USER_GUESS
    fi
  done
  echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', 1, $GUESSES)")
  

else
  echo "$FETCH_USER" | while IFS='|' read UNAME USER_ID GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $UNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    # GAMES_PLAYED=<total number of games that user has played>
    # BEST_GAME=<fewest number of guesses it took that user to win the game>
  done

  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS

  # GUESS
  until [[ $USER_GUESS == $RANDOM_NUMBER ]]
  do
  ((GUESSES++))
    if [[ $USER_GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        read USER_GUESS
      elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:" 
        read USER_GUESS
      fi
    else
      echo "That is not an integer, guess again:"
      read USER_GUESS
    fi
  done
  echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

  UPDATE_GAMES=$($PSQL "UPDATE users SET games_played=$(( ++GAMES_PLAYED )) WHERE username='$USERNAME'")
  if [[ $GUESSES -lt $BEST_GAME ]]
  then
    UPDATE_BEST=$($PSQL "UPDATE users SET best_game=$GUESSES WHERE username='$USERNAME'")
  fi
fi



