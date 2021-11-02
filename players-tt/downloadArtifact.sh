#!/bin/bash

set -x

ENDPOINT="https://server.rsmaxwell.co.uk/archiva/repository"
REPOSITORY="releases"
GROUP="com.rsmaxwell.players"
ARTIFACT="players-tt"
PACKAGING="zip"

BASE="${ENDPOINT}/${REPOSITORY}/${GROUP//.//}/${ARTIFACT}"

( cd /tmp; wget --quiet ${BASE}/maven-metadata.xml )
result=$?
if [ ! ${result} == 0 ]; then
    echo "Error: $0[${LINENO}]"
    echo "result: ${result}"
    exit 1
fi

line=$(grep release /tmp/maven-metadata.xml)

regex="<release>(.*)</release>"
if [[ ! ${line} =~ ${regex} ]]; then
    echo "Error: $0[${LINENO}]"
    exit 1
fi

version="${BASH_REMATCH[1]}"
FILENAME="${ARTIFACT}-${version}.zip"

echo "downloading ${FILENAME}"
(cd /tmp; rm -rf maven-metadata.xml ${ARTIFACT}-*.zip* )

ls -al /tmp
rm -rf /tmp/${FILENAME}

( cd /tmp; wget --quiet ${BASE}/${version}/${FILENAME} )
result=$?
if [ ! ${result} == 0 ]; then
    echo "Error: $0[${LINENO}]"
    echo "result: ${result}"
    exit 1
fi

ls -al /tmp
pwd
ls -al 

unzip /tmp/${FILENAME}
result=$?
if [ ! ${result} == 0 ]; then
    echo "Error: $0[${LINENO}]"
    echo "result: ${result}"
    exit 1
fi

rm -rf /tmp/${FILENAME}

ls -al /tmp
ls -al 
