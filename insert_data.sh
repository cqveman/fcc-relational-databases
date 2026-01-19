#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Insert countries
sed '1d' games.csv \
| sed -E 's/^[^,]*,[^,]*,([^,]*),([^,]*),.*/\1\n\2/' \
| sort \
| uniq \
| while read TEAM
do
  $PSQL "INSERT INTO teams(name) VALUES('$TEAM') ON CONFLICT (name) DO NOTHING;"
done

# Insert games
sed '1d' games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # Get winner_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")

  # Get opponent_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

  # Insert game
  $PSQL "
    INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS);
  "
done