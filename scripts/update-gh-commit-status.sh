#!/bin/sh

URL="https://api.github.com/repos/${WORK_REPOSITORY_NAME}/statuses/${WORK_REPOSITORY_SHA}"
echo "Update URL: ${URL}"


STATUS_CODE=$(curl -XPOST -s -o /dev/null -w '%{http_code}' -H "Authorization: token ${PA_TOKEN}" -H 'Accept: application/vnd.github.everest-preview+json' -H 'Content-Type: application/json' ${URL} --data '{"state": "success"}')
if [ $STATUS_CODE -eq 200 ]
then
  echo "  Request succesful!"
  exit 0
else 
  echo "  Request failed with StatusCode: ${STATUS_CODE}"
  exit 1
fi

