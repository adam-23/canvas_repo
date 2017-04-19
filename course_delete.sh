#!/bin/bash
source api_config.sh

# While gate for sensitive commands.
echo -n "Sensitive commands ahead. If ready, type yes > "
# Sets up user to type "yes" on the same line.
read WHILEGATE
# Save user input as a variable.

while [ $WHILEGATE != "yes" ]
do
echo "You didn't type yes."
echo -n "If ready, type yes > "
read WHILEGATE
done
# While not yes, ask them to type yes repeatedly.

echo -n "Course ID to delete? > "
read delete_id

curl https://$domain.instructure.com/api/v1/courses/$delete_id \
  -X DELETE \
  -H "Authorization: Bearer $token" \
  -d "event=delete" \
  | python -m json.tool
