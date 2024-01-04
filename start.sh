#!/bin/sh

set -e

[ $# -gt 0 ] && case $1 in
    serve)
    ;;
    *)
        exec $@
    ;;
esac

INIT_PATH=/docker-init

[ ! -f $INIT_PATH ] && container-create.sh && touch $INIT_PATH

container-start.sh

nginx -g 'daemon off;'
