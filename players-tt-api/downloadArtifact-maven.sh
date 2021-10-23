#!/bin/bash

REPOSITORY="releases"
GROUPID="com.rsmaxwell.players"
ARTIFACTID="players-tt-api_amd64-linux"
PACKAGING="zip"
VERSION=LATEST

URL=https://server.rsmaxwell.co.uk/archiva/repository/${REPOSITORY}

rm -rf ~/.m2/repository/${GROUPID//.//}/${ARTIFACTID} players-tt-api

mvn dependency:get -DgroupId=${GROUPID//.//} -DartifactId=${ARTIFACTID} -Dversion=${VERSION} -Dpackaging=${PACKAGING} -DremoteRepositories=${URL}

rm -rf bin
mkdir bin
cd bin

find ~/.m2/repository/${GROUPID//.//}/${ARTIFACTID} -name "${ARTIFACTID}-*.zip" -exec unzip {} \;
