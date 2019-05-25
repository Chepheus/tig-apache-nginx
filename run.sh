#!/bin/bash

docker network create --driver bridge custom_network

mkdir -p nginx/src/data
mkdir -p apache/src/data
mkdir -p TIG/data
mkdir -p TIG/data/grafana
mkdir -p TIG/data/influxdb

cd nginx &&  docker-compose up -d && cd ..
cd apache && docker-compose up -d && cd ..
cd TIG && docker-compose up -d && cd ..

curl -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE telegraf'