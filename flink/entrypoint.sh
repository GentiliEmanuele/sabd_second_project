#!/bin/bash
export HADOOP_CLASSPATH=$(hadoop classpath)
echo "HADOOP_CLASSPATH:\n$HADOOP_CLASSPATH"
exec /docker-entrypoint.sh "$@"