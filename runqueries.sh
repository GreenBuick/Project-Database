#!/bin/bash

db="Checkpoint2-dbase.sqlite3"

./makeit.sh
sqlite3 $db < Checkpoint2-script.sql