#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=postgres --tuples-only -c"
CREATE_DB=$($PSQL "CREATE DATABASE number_guess")
echo $CREATE_DB
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
CREATE_TABLE=$($PSQL "CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(22) UNIQUE, games_played INT DEFAULT 0, best_game INT DEFAULT 0)")
echo $CREATE_TABLE