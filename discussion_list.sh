#!/bin/bash
source api_config.sh

echo -n "Enter course ID > "
read course_id

touch listed_discussions.txt

curl https://$domain.instructure.com/api/v1/courses/$course_id/discussion_topics \
  -X GET \
  -H "Authorization: Bearer $token" \
  | python -m json.tool >> listed_discussions.txt
  # Format the output using python and then pipe it all over to a file.
