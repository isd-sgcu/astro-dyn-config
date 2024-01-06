#!/bin/sh

set -e

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

cd $SCRIPT_DIR

[ $# -gt 0 ] && case $1 in
    serve)
    ;;
    *)
        exec $@
    ;;
esac

sh container-start.sh

nginx -g 'daemon off;'
