#!/bin/bash

echo "${TITLE}" > /var/www/html/index.html

nginx -g 'daemon off;'