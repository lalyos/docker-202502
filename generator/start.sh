#!/bin/bash

while true; do
  cat > /www/${HTML_FILE:-index.html}<<EOF
  <html>
  <body bgcolor="${COLOR:-gray}">
  <h1>${TITLE:-Welcome}<h1>

  $(
    mariadb \
    mysql \
    --html \
    --password=s3cr3t  \
    --execute='select * from food' \
    --host=db
  )
  <hr>
  </body></html>
EOF


  sleep ${SLEEP:-5}
done