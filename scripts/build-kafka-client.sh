mkdir -p kafka-client/target
git clone git@github.com:GentiliEmanuele/batches_producer.git
mvn clean install -f batches_producer/pom.xml
cp batches_producer/target/*-with-dependencies.jar kafka-client/target/app.jar
rm -rf ./batches_producer