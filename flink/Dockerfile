FROM flink:2.0.0

RUN wget https://downloads.apache.org/hadoop/common/current/hadoop-3.4.1.tar.gz \
    && tar -zxf hadoop-3.4.1.tar.gz -C /usr/local/ \
    && rm hadoop-3.4.1.tar.gz \
    && cd /usr/local && ln -s ./hadoop-3.4.1 hadoop && cd /

ENV HADOOP_COMMON_HOME=/usr/local/hadoop
ENV HADOOP_HDFS_HOME=/usr/local/hadoop
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_MAPRED_HOME=/usr/local/hadoop
ENV HADOOP_YARN_HOME=/usr/local/hadoop
ENV HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
ENV PATH="$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin"

ARG HDFS_PLUGIN_DIR=${FLINK_HOME}/plugins/hadoop-fs
RUN mkdir -p ${HDFS_PLUGIN_DIR}

RUN wget -O ${HDFS_PLUGIN_DIR}/flink-hadoop-fs-2.0.0.jar https://repo1.maven.org/maven2/org/apache/flink/flink-hadoop-fs/2.0.0/flink-hadoop-fs-2.0.0.jar
RUN wget -O ${HDFS_PLUGIN_DIR}/flink-hadoop-bulk-2.0.0.jar https://repo1.maven.org/maven2/org/apache/flink/flink-hadoop-bulk/2.0.0/flink-hadoop-bulk-2.0.0.jar
RUN wget -O ${HDFS_PLUGIN_DIR}/flink-hadoop-compatibility-2.0.0.jar https://repo1.maven.org/maven2/org/apache/flink/flink-hadoop-compatibility/2.0.0/flink-hadoop-compatibility-2.0.0.jar

COPY core-site.xml ${HADOOP_CONF_DIR}/

COPY entrypoint.sh /usr/local/entrypoint.sh
ENTRYPOINT [ "/usr/local/entrypoint.sh" ]