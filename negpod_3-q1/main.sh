#!/bin/bash

# Prompt the user to choose whether to add, remove, or update a record
echo "Do you want to add, remove, update a record or exit ? (add/remove/update/exit)"
read ACTION

# Use an `if` statement to check the user's response and take the appropriate action
if [[ "$ACTION" == "add" ]]; then
  # Add the record to the file
  echo "Student email:"
  read EMAIL
  echo "Student age:"
  read AGE
  echo "Student ID:"
  read ID
  echo "$EMAIL,$AGE,$ID" >> students-list_0923.txt
elif [[ "$ACTION" == "remove" ]]; then
  # Remove the record from the file
  echo "Enter the ID of the record you want to remove:"
  read ID
  sed -i "/$ID/d" students-list_0923.txt
elif [[ "$ACTION" == "update" ]]; then
  # Update the record in the file
  echo "Enter the ID of the record you want to update:"
  read ID

  # Use the `grep` command to search for the record in the file
  RECORD=$(grep -F "$ID" students-list_0923.txt)

  # If the record is found, split it into individual fields using the `awk` command
  if [[ -n "$RECORD" ]]; then
    IFS=',' read -ra FIELDS <<< "$RECORD"

    # Prompt the user to enter the new values for the fields they want to update
    echo "Enter the new email address:"
    read EMAIL
    echo "Enter the new age:"
    read AGE

    # Update the fields in the array
    FIELDS[0]="$EMAIL"
    FIELDS[1]="$AGE"
    FIELDS[2]="$ID"

    NEW_RECORD=$(printf "%s,%s,%s\n" "${FIELDS[0]}" "${FIELDS[1]}" "${FIELDS[2]}")
    sed -i "/$ID/c$NEW_RECORD" students-list_0923.txt


    echo "The record has been updated successfully."
  else
    echo "The record with the ID $ID could not be found."
  fi
  elif [[ "$ACTION" == "exit" ]]; then
	  echo $?
else
  echo "Invalid action."
fi

