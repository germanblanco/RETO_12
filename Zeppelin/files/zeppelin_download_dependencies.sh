#!/bin/bash
export ZEPPELIN_HOST="localhost"
export ZEPPELIN_PORT="8080"

/usr/zeppelin/bin/zeppelin-daemon.sh start

until nc -vzw 2 ${ZEPPELIN_HOST} ${ZEPPELIN_PORT}; do sleep 10; done
sleep 2

/usr/zeppelin/bin/zeppelin-daemon.sh stop
