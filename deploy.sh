#!/bin/sh

export TAO_SERVER_NAME=188.226.145.196
export TAO_POSTGRES_USER=postgres
export TAO_POSTGRES_DB=dbname
export TAO_POSTGRES_PASSWORD=dbpass

docker build --build-arg request_domain=$TAO_SERVER_NAME -t sorrell/docker-tao-web .
docker-compose up -d

ID=$(docker ps | grep "postgres" | awk '{print $1}')
docker exec $ID createdb -U $TAO_POSTGRES_USER $TAO_POSTGRES_DB