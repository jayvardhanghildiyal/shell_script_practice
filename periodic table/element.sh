#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if no arugment was provided, ask for one
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
# if an argument was provided, roll with it
else 
  ARG=$1

  # if the argument was a number, then it must be the atomic mass
  if [[ $ARG =~ ^[0-9]+$ ]]
  then
    EDATA=$($PSQL "select * from elements where atomic_number = $ARG")
  # if not, then it must be the symbol or the name of the element
  elif [[ ! $ARG =~ ^[0-9]+$ ]]
  then
    EDATA=$($PSQL "select * from elements where symbol = '$ARG' or name = '$ARG'")
  fi

  if [[ -z $EDATA ]]
    then
      echo I could not find that element in the database.
      exit 0
  fi

  echo $EDATA | while read AN BAR SYMBOL BAR NAME
  do
    # echo $AN, $SYMBOL, $NAME
    PDATA=$($PSQL "select * from properties where atomic_number = $AN")
    
    echo $PDATA | while read AN BAR AM BAR MP BAR BP BAR ID
    do
      TYPE="metalloid"
      
      if [[ $ID == 1 ]]
      then
        TYPE="metal"
      elif [[ $ID == 2 ]] 
      then
        TYPE="nonmetal"
      fi
      echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  done
fi



# The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

# {
#   "database": {
#     "create": "CREATE DATABASE database_name;",
#     "drop": "DROP DATABASE database_name;",
#     "rename": "ALTER DATABASE database_name RENAME TO new_name;"
#   },
#   "table": {
#     "create": "CREATE TABLE table_name();",
#     "drop": "DROP TABLE table_name;",
#     "rename": "ALTER TABLE table_name RENAME TO new_name;"
#   },
#   "row": {
#     "insert": "INSERT INTO table_name(columns) VALUES(values);",
#     "update": "UPDATE table_name SET column_name = new_value WHERE condition;",
#     "delete": "DELETE FROM table_name WHERE condition;"
#   },
#   "column": {
#     "add": "ALTER TABLE table_name ADD COLUMN column_name;",
#     "drop": "ALTER TABLE table_name DROP COLUMN column_name;",
#     "rename": "ALTER TABLE table_name RENAME COLUMN column_name TO new_name;",
#     "primary_key": "ALTER TABLE table_name ADD PRIMARY KEY(column_name);",
#     "foreign_key": "ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES table_name(column_name);"
#   }
# }
