#!/bin/bash

envFile=".env"

if [ -f "$envFile" ]
then
  # . $envFile

  sudo docker-compose up $1

else
  echo "'$envFile' not found."
  echo "copy '.env.template' to '$envFile' and update it according to your environment"
fi

