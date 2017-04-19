#!/bin/bash
source api_config.sh

curl https://$domain.instructure.com/api/v1/accounts/$account/courses \
  -X POST \
  -H "Authorization: Bearer $token" \
  -d "course[name]=$course_name" \
  | python -m json.tool
