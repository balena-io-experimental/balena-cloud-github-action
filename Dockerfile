FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && \
    apt install -qq -y curl unzip

RUN curl -L https://github.com/balena-io/balena-cli/releases/download/v11.30.17/balena-cli-v11.30.17-linux-x64-standalone.zip \
    --output /tmp/balena-cli.zip

RUN unzip /tmp/balena-cli.zip -d /opt \
    && ln -s /opt/balena-cli/balena /usr/local/bin/balena

WORKDIR /src

COPY entrypoint.sh /entrypoint.sh
CMD [ "/entrypoint.sh" ]

