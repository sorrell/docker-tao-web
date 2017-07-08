#!/bin/bash

TAO_VERSION=latest

docker commit dockertaoweb_tao_1 tao-web:$TAO_VERSION
docker commit dockertaoweb_pgdb_1 tao-db:$TAO_VERSION
