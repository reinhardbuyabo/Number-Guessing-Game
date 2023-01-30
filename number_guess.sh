#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER

echo -e "Enter your username: "
read USERNAME

FETCH_USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")

GUESS(){
  GUESSES=1
  until [[ $USER_GUESS == $RANDOM_NUMBER ]]
  do
  ((GUESSES++))
    if [[ $USER_GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $USER_GUESS > $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        read USER_GUESS
      elif [[ $USER_GUESS < $RANDOM_NUMBER ]]
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
  if [[ $INSERT_USER == "INSERT 0 1" ]]
  then
    echo "Good first game!"
  fi
}

if [[ -z $FETCH_USER ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS

  GUESS

else
  echo "$FETCH_USER" | while IFS='|' read NAME USER_ID GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    # GAMES_PLAYED=<total number of games that user has played>
    # BEST_GAME=<fewest number of guesses it took that user to win the game>
  done
fi



