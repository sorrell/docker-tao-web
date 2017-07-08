#!/bin/bash

TAO_VERSION=latest

docker run -d --name tao-db tao-db:$TAO_VERSION
docker run -d -p 80:80 --name tao-web --link tao-db:pgdb tao-web:$TAO_VERSION
