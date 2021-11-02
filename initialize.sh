#!/bin/bash

set -x

docker system prune --all --force
docker volume prune --force
docker-compose build

mkdir -p ~/mosquitto/config ~/mosquitto/log ~/mosquitto/data
mkdir -p ~/players-tt-api/config ~/players-tt-api/log ~/players-tt-api/dump

docker-compose up -d
docker-compose down

sudo rm -rf ~/mosquitto/config/* ~/mosquitto/log/* ~/mosquitto/data/*
rm -rf ~/players-tt-api/config/* ~/players-tt-api/log/* ~/players-tt-api/dump/*

sudo cp mqtt/config/* ~/mosquitto/config/
cp players-tt-api/config/* ~/players-tt-api/config/
