#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# empty the tables 
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND W O WG OG
do
  # this makes sure that we aren't reading the first line
  if [[ $YEAR != "year" ]]
  then
    # get winning and opponent team id
    TEAM_ID_W=$($PSQL "select team_id from teams where name = '$W'")
    TEAM_ID_O=$($PSQL "select team_id from teams where name = '$O'")
    
    # add winning team if not present
    if [[ -z $TEAM_ID_W  ]]
    then
      ADD_TEAM_W=$($PSQL "insert into teams (name) values ('$W')")

      if [[ $ADD_TEAM_W == "INSERT 0 1" ]]
      then
        echo "added team, $W"
      fi
    fi
    
    # add opponent team if not present
    if [[ -z $TEAM_ID_O  ]]
    then
      ADD_TEAM_O=$($PSQL "insert into teams (name) values ('$O')")

      if [[ $ADD_TEAM_O == "INSERT 0 1" ]]
      then
        echo "added team, $O"
      fi
    fi
    
    # get winning and opponent team id anew
    TEAM_ID_W=$($PSQL "select team_id from teams where name = '$W'")
    TEAM_ID_O=$($PSQL "select team_id from teams where name = '$O'")

    # adding the game record for the teams added
    INSERT_GAME=$($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ('$YEAR', '$ROUND', '$TEAM_ID_W', '$TEAM_ID_O', '$WG', '$OG')")
    if [[  $INSERT_GAME == "INSERT 0 1"  ]]
    then 
      echo added game, $W vs $O
    fi
  fi
done
