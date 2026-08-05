#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "
# $($PSQL "")
echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

# dynamically print all services
SERVICES=$($PSQL "select service_id, name from services")
echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
do
  echo "$SERVICE_ID) $SERVICE"
done

read SERVICE_ID_SELECTED

while [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]
do
  echo -e "\nI could not find that service. What would you like today?"
  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED
done

# ask for phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# phone number
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
# if not then ask for name and add it
if [[ -z $CUSTOMER_ID ]]
then
  # ask for name
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  # add name and phone number
  ADD_NAME_AND_NUMBER=$($PSQL "insert into customers (phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
CUSTOMER_NAME=$($PSQL "select name from customers where customer_id = '$CUSTOMER_ID'")
# ask for appointment time
echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
read SERVICE_TIME

ADD_TIME=$($PSQL "insert into appointments (customer_id, service_id, time) values ($CUSTOMER_ID, '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
# end with formal message
SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
