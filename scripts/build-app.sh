mkdir -p target
git clone git@github.com:francescodonnini/progetto2.git
mvn clean install -f progetto2
cp progetto2/target/progetto2-1.0-SNAPSHOT.jar target
rm -rf ./progetto2
