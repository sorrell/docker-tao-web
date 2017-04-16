#!/bin/sh

export TAO_SERVER_NAME=188.226.145.196
export TAO_POSTGRES_DB=taodb
export TAO_POSTGRES_USER=postgres
export TAO_POSTGRES_PASSWORD=dbpass

echo
echo -- Build TAO image
#docker build --build-arg TAO_SERVER_NAME=$TAO_SERVER_NAME -t sorrell/docker-tao-web .

echo
echo -- Up TAO and Postgres images
docker-compose up -d

echo
echo -- Wait 5 second Postgres to up and run
sleep 5

echo
echo -- Create TAO database
ID=$(docker ps | grep "postgres" | awk '{print $1}')
docker exec -it $ID createdb -U ${TAO_POSTGRES_USER} ${TAO_POSTGRES_DB}