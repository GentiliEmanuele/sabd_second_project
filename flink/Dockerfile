FROM apache/flink:2.0.0

RUN set -ex && \
    apt-get update && \
    apt-get install -y iproute2

RUN mkdir -p /opt/scripts

COPY entrypoint.sh /opt/scripts/

RUN chmod +x /opt/scripts/entrypoint.sh

ENTRYPOINT [ "/opt/scripts/entrypoint.sh" ]