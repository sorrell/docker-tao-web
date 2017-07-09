#!/bin/bash

TAO_VERSION=latest

sudo docker run -d --name tao-db tao-db:$TAO_VERSION
sudo docker run -d -p 80:80 --name tao-web --link tao-db:pgdb tao-web:$TAO_VERSION
