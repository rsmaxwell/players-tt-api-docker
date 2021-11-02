FROM nginx:latest


RUN apt-get update
RUN apt-get install -y wget unzip


WORKDIR /usr/share/nginx/html
COPY downloadArtifact.sh  .
RUN ./downloadArtifact.sh


RUN rm downloadArtifact.sh
RUN apt-get remove -y wget unzip

