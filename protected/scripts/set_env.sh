#!/bin/sh

export DB_HOST=localhost
export DB_NAME=giasu
export DB_USER=giasu
export DB_PASS=secret

alias domysql='mysql -h $DB_HOST -u $DB_USER -p${DB_PASS} $DB_NAME'
