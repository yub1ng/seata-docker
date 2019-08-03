FROM hub.c.163.com/library/java:8-alpine

ARG SEATA_VERSION=0.7.1

RUN apk add --no-cache wget \
	&& wget  https://github.com/seata/seata/releases/download/v${SEATA_VERSION}/seata-server-${SEATA_VERSION}.tar.gz -P /home \
	&& mkdir /home/seata \
	&& tar -xzvf /home/seata-server-${SEATA_VERSION}.tar.gz -C /home/seata \
    && rm -rf /home/seata-server-${SEATA_VERSION}.tar.gz

ENTRYPOINT ["sh","/home/seata/bin/seata-server.sh"]
EXPOSE 8091