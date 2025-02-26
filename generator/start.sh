#!/bin/bash

while true; do
  echo "<h1>${TITLE:-Welcome}<h1>" > /www/index.html

  mariadb \
    mysql \
    --html \
    --password=s3cr3t  \
    --execute='select * from food' \
    --host=db  \
    >> /www/index.html

  sleep ${SLEEP:-5}
done