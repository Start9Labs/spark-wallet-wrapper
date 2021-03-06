FROM node:current-alpine3.12

ARG SPARK_VERSION

RUN apk update
RUN apk add tini

RUN npm install -g spark-wallet@${SPARK_VERSION}

ADD ./configurator/target/armv7-unknown-linux-musleabihf/release/configurator /usr/local/bin/configurator
ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

WORKDIR /root/.spark-wallet

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]
