FROM ubuntu

RUN apt-get update
RUN apt-get install -y wget unzip

RUN useradd fred
RUN usermod -L fred
RUN usermod -a -G fred fred

RUN mkdir -p /players-tt-api/config /players-tt-api/log
COPY config.json  /players-tt-api/config

WORKDIR /home/fred
COPY downloadArtifact.sh  .
RUN ./downloadArtifact.sh
RUN rm downloadArtifact.sh

RUN chown -R fred:fred *
RUN chmod -R 700 /home/fred/bin /home/fred/players-tt-api
RUN chmod 600 /home/fred/players-tt-api/config/config.json

RUN apt-get -y remove wget unzip
RUN apt-get -y autoremove wget unzip
RUN apt-get -y purge --auto-remove wget unzip

USER fred
ENTRYPOINT ["bash", "-c", \
    "/home/fred/bin/players-tt-api/players-tt-api", \
    "--config", "/players-tt-api/config", \
    "1>/players-tt-api/log/players-tt-api.log", \
    "2>/players-tt-api/log/players-tt-api.stderr"]