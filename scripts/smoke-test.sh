#!/bin/bash
for NUMBER_TRY in {1..60}
do
  RESPONSE=$(wget --spider --server-response http://localhost:3000/ 2>&1 | grep -c '200\ OK')

  if [[ $RESPONSE == 1 ]]
  then
    echo "success"
    exit 0
  fi

  echo "retrying"
  sleep 1
done

exit 1