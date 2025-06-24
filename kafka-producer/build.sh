mkdir kafka-target
cd kafka-target
git clone git@github.com:GentiliEmanuele/batches_producer.git
mvn clean install -f batches_producer/pom.xml
cp batches_producer/target/batches_producer-1.0-SNAPSHOT-jar-with-dependencies.jar ./app.jar
rm batches_producer -rf
