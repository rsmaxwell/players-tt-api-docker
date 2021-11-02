FROM nginx:latest


RUN apt-get update
RUN apt-get install -y wget unzip


WORKDIR /usr/share/nginx/html
COPY downloadArtifact.sh  /tmp
RUN ./downloadArtifact.sh


RUN rm downloadArtifact.sh
RUN apt-get remove -y wget unzip

RUN pwd
RUN ls -al 