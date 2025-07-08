# Build ed esecuzione dell'applicazione
All'interno della directory `scripts/` troviamo lo script `build.sh` il quale prende come parametro URL della repository su GitHub che si vuole clonare: si deve utilizzare il seguente path https://github.com/francescodonnini/progetto2.git.
Internamente questo script:
1. Clona la repository utilizzata come parametro in una directory temporanea
2. Utilizzando il comando `mvn clean install` genera i jar: `flink-job.jar` e `spark-job.jar`
3. Questi due jar verranno copiati all'interno dei volumi utilizzati da Docker.

Dunque eseguendo il comando `docker compose -f compose.yaml up -d` verrà lanciato il cluster Flink e il Challenger. A questo punto utilizzando lo script `scripts/submit-job.sh` verrà lanciato il job che esegue la pipeline utilizzando 
Flink. 

Analogamente su Spark si lancia il comando `docker compose -f spark-compose.yaml up -d` per lanciare il cluster e con lo script `scripts/submit-spark-job.sh` viene sottomesso il job Spark. 


