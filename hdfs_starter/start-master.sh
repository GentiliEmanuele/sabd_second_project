/usr/local/bootstrap.sh
hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
hdfs dfs -mkdir -p /user/flink
hdfs dfs -chown flink:flink /user/flink
/bin/bash
