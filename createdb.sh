#!/bin/sh
ID=$(docker ps | grep "postgres" | awk '{print $1}')
echo $ID

docker exec $ID createdb -U postgres dbname