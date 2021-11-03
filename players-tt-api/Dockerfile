FROM ubuntu

RUN apt-get update
RUN apt-get install -y wget unzip

RUN useradd fred
RUN usermod -L fred
RUN usermod -a -G fred fred

RUN mkdir -p /players-tt-api/config /players-tt-api/log /players-tt-api/dump
COPY config/config.json  /players-tt-api/config

WORKDIR /home/fred
COPY entrypoint.sh  .
COPY downloadArtifact.sh  .
RUN ./downloadArtifact.sh
RUN rm downloadArtifact.sh

RUN chown -R fred:fred *
RUN chown -R fred:fred /players-tt-api/*
RUN chmod -R 700 /home/fred/bin /players-tt-api/config
RUN chmod 600 /players-tt-api/config/config.json
RUN apt-get -y remove wget unzip
RUN apt-get -y purge --auto-remove wget unzip
RUN apt-get -y autoremove 

USER fred
CMD [ "./entrypoint.sh"  ]