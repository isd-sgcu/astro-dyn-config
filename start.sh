#!/bin/sh

set -e

[ $# -gt 0 ] && case $1 in
    serve)
    ;;
    *)
        exec $@
    ;;
esac

container-start.sh

nginx -g 'daemon off;'
