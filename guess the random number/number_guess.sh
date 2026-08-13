#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=random_game -t --no-align -c"

# create a random number between 0 to n
# so, we add one at the end to generate a number from 1 to (n + 1) 
RANDOM_NUMBER=$((RANDOM % 1000 + 1))
echo Enter your username:

# data base should allow usernames with a limit of 22 characters i think
# so basically the datatype is varchar(22) 
read USERNAME

USER_FOUND=$($PSQL "select name from game where name = '$USERNAME'")
if [[ -z $USER_FOUND ]]
then
  # if the username is new
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  PLAYED=$($PSQL "select games_played from game where name = '$USERNAME'")
  BEST=$($PSQL "select best_score from game where name = '$USERNAME'")
  # if username exists
  echo "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses."
fi
echo "Guess the secret number between 1 and 1000:"

# user's guess
read GUESS
# number of tries
COUNT=1

while [[ $GUESS != $RANDOM_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $RANDOM_NUMBER -lt $GUESS ]]
  then
    echo "It's lower than that, guess again:"
    (( COUNT+=1 ))
  elif [[ $RANDOM_NUMBER -gt $GUESS ]]
  then
    echo "It's higher than that, guess again:"
    (( COUNT+=1 ))
  else
    break
  fi

  read GUESS
done

echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"

# update user info
USER_FOUND=$($PSQL "select name from game where name = '$USERNAME'")

# if user not found, add the user
if [[ -z $USER_FOUND ]]
then
  ADD_NEW_USER=$($PSQL "insert into game values ('$USERNAME', 1, $COUNT)") 
else
  PLAYED=$($PSQL "select games_played from game where name = '$USERNAME'")
  (( PLAYED+=1 ))
  BEST=$($PSQL "select best_score from game where name = '$USERNAME'")
  
  # update the games_played count (have to do for both situations regardless)
  UPDATE_PLAYED=$($PSQL "update game set games_played = $PLAYED where name = '$USERNAME'")
  if [[ $BEST -gt $COUNT ]]
  then
    UPDATE_BEST_SCORE=$($PSQL "update game set best_score = $COUNT where name = '$USERNAME'")
  fi
  # echo played : $PLAYED,best : $BEST,count : $COUNT
fi
