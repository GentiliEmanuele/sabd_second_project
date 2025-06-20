mkdir ../target
git clone https://github.com/francescodonnini/progetto2.git flink
mvn clean install -f flink/pom.xml -U
cp flink/target/progetto2-1.0-SNAPSHOT.jar ../target
rm -rf flink
