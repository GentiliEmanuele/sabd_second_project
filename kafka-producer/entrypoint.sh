#!/bin/bash
until curl -s $GC25_API_ENDPOINT >/dev/null; do
  sleep 2
done
java -jar /opt/app/app.jar "$@"