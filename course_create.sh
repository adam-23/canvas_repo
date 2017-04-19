#!/bin/bash
### Create a new course. WIll ask for course name and code.
source api_config.sh

echo -n "Name the course > "
read course_name

echo -n "Give course code > "
read course_code

curl https://$domain.instructure.com/api/v1/accounts/$account/courses \
  -X POST \
  -H "Authorization: Bearer $token" \
  -d "course[name]=$course_name" \
  -d "course[course_code]=$course_code" \
  | python -m json.tool
