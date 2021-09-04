#!/bin/bash

EMAIL="usermail@testmail.com"
LOG_FILE="access.log"

SUBJECT="Apache: High number of error responses"
MESSAGE=$(tail -5 access.log)

value=$(cat $LOG_FILE | cut -d ' ' -f 9 | egrep '4|5' | wc -l)

if [[  "$value" -gt 100 ]]; then 
    echo "$MESSAGE" | mail -s "$SUBJECT"-$(date +"%F") "$EMAIL"
fi