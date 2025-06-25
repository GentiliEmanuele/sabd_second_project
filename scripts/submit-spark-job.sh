docker exec spark-master /opt/spark/bin/spark-submit --class it.sabd2425.spark.SparkStreamingApp --packages org.apache.spark:spark-sql-kafka-0-10_2.13:4.0.0 /opt/app/app.jar
