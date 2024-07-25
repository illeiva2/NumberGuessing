#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
echo "Enter your username:"
read USERNAME
USER_EXISTS=$($PSQL "SELECT id FROM users WHERE username = '$USERNAME'")
if [[ -z "$USER_EXISTS" ]]
then
  CREATE_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
  read -r GAMES_PLAYED BAR BEST_GAME <<< $USER_INFO
else
  USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
  read -r GAMES_PLAYED BAR BEST_GAME <<< $USER_INFO
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
SECRET_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
GUEESSES=0
echo "Guess the secret number between 1 and 1000:"
read GUESS
while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS
done
while [[ $GUESS -ne $SECRET_NUMBER ]]
do
  if [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    GUEESSES=$((GUEESSES + 1))
  else
    echo "It's lower than that, guess again:"
    GUEESSES=$((GUEESSES + 1))
  fi
  read GUESS
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS
done
done
GUEESSES=$((GUEESSES + 1))
echo "You guessed it in $GUEESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
if [[ $BEST_GAME == 0 ]]
then
  UPDATE_USER=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $GUEESSES WHERE username = '$USERNAME'")
elif [[ $GUEESSES -lt $BEST_GAME ]]
then
  UPDATE_USER=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $GUEESSES WHERE username = '$USERNAME'")
  else
  UPDATE_USER=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
fi
