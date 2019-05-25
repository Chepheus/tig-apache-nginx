#!/bin/bash

cd nginx && docker-compose down && cd ..
cd apache && docker-compose down && cd ..
cd TIG && docker-compose down && cd ..

docker network rm custom_network