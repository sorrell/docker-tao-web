# Docker Recipe for Tao Testing

This is a [Docker](https://www.docker.com/) build recipe for [Tao Testing](http://taotesting.com/)  - an online testing and certification platform.

The easiest way to fire this up is to install Docker Compose and then run

```
docker-compose up

```
That should download the base image for both sorrell/tao-web and postgres.

Next determine the ip address of your postgres container and create the tao
database:

```
createdb -h 172.17.0.29 -U postgres dbname
```

Once your tao container is running determine the IP address of your tao server and open your browser at that address, then follow the installation wizard.  For the database hostname you should use `pgdb` as outlined in the docker-compose.yml, and you should use the `dbname` specified in your `createdb` with **Overwrite option selected**.

For the postgresql connection, the user is 'postgres' and
password is 'example' - you can change the password in the docker-compose.yml.


-----------------
