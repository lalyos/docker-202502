#!/bin/bash

echo "<h1>Tuesday Menu v2<h1>" > /www/index.html

mariadb \
  mysql \
  --html \
  --password=s3cr3t  \
  --execute='select * from food' \
  --host=db  \
  >> /www/index.html