FROM spark:latest

USER root

RUN mkdir -p /opt/app
COPY spark-target/spark-job.jar /opt/app/app.jar

RUN mkdir -p /usr/local/scripts
COPY entrypoint.sh /usr/local/scripts
RUN chmod u+x /usr/local/scripts/entrypoint.sh


