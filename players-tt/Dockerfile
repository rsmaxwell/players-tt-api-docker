FROM nginx:latest

RUN apt-get update
RUN apt-get install -y wget unzip

RUN find . -name env.template.js
RUN find . -name env.js
RUN pwd

WORKDIR /usr/share/nginx/html
COPY downloadArtifact.sh  /tmp
RUN rm -rf /usr/share/nginx/html/*
RUN /tmp/downloadArtifact.sh

RUN rm /tmp/downloadArtifact.sh
RUN apt-get remove -y wget unzip


# Set environment variables
ENV API_URL="http://localhost:4201/players-api"
ENV PRODUCTION="true"
ENV DEBUG="true"
ENV MQTT_SERVER="localhost"
ENV MQTT_PROTOCOL="ws"
ENV MQTT_PORT="9001"
ENV MQTT_PATH=""


WORKDIR $HOME

# Replace variables in env.js
RUN find . -name env.template.js
RUN find . -name env.js

RUN envsubst < src/assets/env.template.js > src/assets/env.js
