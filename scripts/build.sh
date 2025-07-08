mkdir tmp
git clone $1 tmp
mvn clean install -f tmp/pom.xml
mkdir target
cp tmp/target/flink-job.jar target/app.jar
mkdir spark-target
cp tmp/target/spark-job.jar spark-target/
rm -rf tmp

