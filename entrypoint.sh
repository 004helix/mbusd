#!/bin/sh

exec /opt/mbusd -d -L - -v1 \
    -p ${DEVICE:-/dev/ttyS0} \
    -s ${SPEED:-19200} \
    -m ${MODE:-8N1} \
