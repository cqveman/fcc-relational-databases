#!/bin/bash

DB_USER="freecodecamp"
DB_NAME="salon"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"


PRINT_SERVICES() {
  SERVICES=$(psql -U "$DB_USER" -d "$DB_NAME" -t -A -F"," -c \
  "SELECT service_id, name FROM services;")

  while IFS="," read -r ID NAME; do
    echo "$ID) $NAME"
  done <<< "$SERVICES"
}


GET_SERVICE() {
  while true; do
    PRINT_SERVICES
    read SERVICE_ID_SELECTED

    SERVICE_NAME=$(psql -U "$DB_USER" -d "$DB_NAME" -t -A -c \
    "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

    if [[ -n $SERVICE_NAME ]]; then
      break
    fi

    echo -e "\nI could not find that service. What would you like today?\n"
  done
}


GET_CUSTOMER() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$(psql -U "$DB_USER" -d "$DB_NAME" -t -A -c \
  "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

  if [[ -z $CUSTOMER_NAME ]]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    psql -U "$DB_USER" -d "$DB_NAME" -c \
    "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');"
  fi

  CUSTOMER_ID=$(psql -U "$DB_USER" -d "$DB_NAME" -t -A -c \
  "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
}


GET_TIME_AND_BOOK() {
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  psql -U "$DB_USER" -d "$DB_NAME" -c \
  "INSERT INTO appointments(customer_id, service_id, time)
   VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}


# -------- MAIN --------
GET_SERVICE
GET_CUSTOMER
GET_TIME_AND_BOOK
