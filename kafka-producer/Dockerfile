FROM ubuntu:25.04
USER root

RUN apt-get update
RUN apt-get install -y curl \
        wget \
        tar \
        sudo \
        rsync \
        openjdk-11-jdk \
        vim \
        net-tools \
        build-essential && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin

ENV PATH=$PATH:$JAVA_HOME/bin:/usr/local/bin:/usr/bin

RUN mkdir -p /opt/app
COPY target/app.jar /opt/app/app.jar

RUN mkdir -p /usr/local/scripts
COPY entrypoint.sh /usr/local/scripts
RUN chmod u+x /usr/local/scripts/entrypoint.sh

ENTRYPOINT [ "/usr/local/scripts/entrypoint.sh" ]
