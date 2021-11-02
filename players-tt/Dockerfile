FROM nginx:latest

RUN apt-get update
RUN apt-get install -y wget unzip

RUN useradd bloggs
RUN usermod -L bloggs
RUN usermod -a -G bloggs bloggs

#COPY --from=build /usr/local/players-tt/dist/sample-angular-app /usr/share/nginx/html

WORKDIR /home/bloggs
COPY entrypoint.sh  .
COPY downloadArtifact.sh  .
RUN ./downloadArtifact.sh
RUN rm downloadArtifact.sh

EXPOSE 80