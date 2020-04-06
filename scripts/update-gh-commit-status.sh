#!/bin/sh

WORK_REPOSITORY_NAME=$1
WORK_REPOSITORY_SHA=$2
COMMIT_STATUS_STATE=$3
COMMIT_STATUS_TARGET_URL=$4
COMMIT_STATUS_DESCRIPTION=$5
COMMIT_STATUS_CONTEXT=$6

URL="https://api.github.com/repos/${WORK_REPOSITORY_NAME}/statuses/${WORK_REPOSITORY_SHA}"
echo "Commit status update URL: ${URL}"

STATUS_CODE=$(
  curl \
  -XPOST \
  -s \
  -o /dev/null \
  -w '%{http_code}' \
  -H "Authorization: token ${PA_TOKEN}" \
  -H 'Accept: application/vnd.github.everest-preview+json' \
  -H 'Content-Type: application/json' \
  ${URL} \
  --data "{ \"state\": \"${COMMIT_STATUS_STATE}\", \"target_url\": \"${COMMIT_STATUS_TARGET_URL}\", \"description\": \"${COMMIT_STATUS_DESCRIPTION}\", \"context\": \"${COMMIT_STATUS_CONTEXT}\"   }"
)
if [ $STATUS_CODE -eq 201 ]
then
  echo "  Request succesful!"
  exit 0
else 
  echo "  Request failed with StatusCode: ${STATUS_CODE}"
  exit 1
fi

