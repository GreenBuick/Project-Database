#!/bin/bash

db="Checkpoint2-dbase.sqlite3"

sqlite3 $db < empty-tables.sql
sqlite3 $db < load-tpch.sql