#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  if [[ $YEAR != "year" ]]
  then
    TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID_WINNER ]]
    then
        INSERT_INTO_TEAM_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_INTO_TEAM_WINNER == "INSERT 0 1" ]]
        then
            echo "$WINNER Inserted into Table Teams"
        fi
    fi
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    TEAM_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID_OPPONENT ]]
    then
        INSERT_INTO_TEAM_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        if [[ $INSERT_INTO_TEAM_OPPONENT == "INSERT 0 1" ]]
        then
            echo "$OPPONENT Inserted into Table Teams"
        fi
    fi
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    DATA_IN_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID', '$WINNERGOALS','$OPPONENTGOALS')")
    if [[ $DATA_IN_GAME == "INSERT 0 1" ]]
    then
      echo "Inserted into Games table"
    fi
  fi
done