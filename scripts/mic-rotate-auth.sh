#!/bin/bash

if [ "${ENVIRONMENT}" == "acceptance" ]
then
  URL="https://httpstat.us/200?cluster=${CLUSTER}"
else
  URL="https://httpstat.us/404?cluster=${CLUSTER}"
fi

echo "Calling endpoint: ${URL}"

STATUS_CODE=$(curl -s -o /dev/null -w '%{http_code}' ${URL})
if [ $STATUS_CODE -eq 200 ]
then
  echo "  Request succesful!"
  exit 0
else 
  echo "  Request failed with StatusCode: ${STATUS_CODE}"
  exit 1
fi

