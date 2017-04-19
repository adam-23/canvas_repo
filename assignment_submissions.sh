source api_config.sh

echo -n "Enter assignment_id > "
read assignment_id

touch listed_submitted_assignments.txt
> listed_submitted_assignments.txt

curl https://$domain.instructure.com/api/v1/courses/$course_id/assignments/$assignment_id/submissions \
  -X GET \
  -H "Authorization: Bearer $token" \
  | python -m json.tool >> listed_submitted_assignments.txt
