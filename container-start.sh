#!/bin/sh

set -e

cd /app

npm run build

rm -r /usr/share/nginx/html/*

cp -r dist/* /usr/share/nginx/html
