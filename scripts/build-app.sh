mkdir -p $3/target
git clone $1 $2
mvn clean install -f $2/pom.xml
cp $2/target/*-with-dependencies.jar $3/target/app.jar
rm -rf $2
