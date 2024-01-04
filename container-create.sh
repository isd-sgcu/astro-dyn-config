#!/bin/sh

set -e

cd /app

[ -f package-lock.json ] && npm ci
[ ! -f package-lock.json ] && npm i
