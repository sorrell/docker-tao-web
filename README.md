# Docker Recipe for Tao Testing

This is a [Docker](https://www.docker.com/) build recipe for [Tao Testing](http://taotesting.com/)  - an online testing and certification platform.

The easiest way to fire this up is to follow these instructions:

### Variant 1
1. Install Docker and Docker Compose
2. Modify variable inside **setup.sh** and **.env** accorting to your needs and host parameter
3. Execute **> sudo ./setup.sh**
4. Open http://your-host and follow installation wizard
    * Use **pgdb** as **database host** name
    * Use **TAO_POSTGRES_DB** value from **setup.sh** as **database name**
    * Select the **Overwrite option**

### Variant 2
1. Install Docker Compose 
2. Run `docker-compose up`
3. Postgres container username=`postgres` and password=`example` as declared in the docker-compose.yml 
4. Determine the ip address of your postgres container and create the tao database: `createdb -h ip.address.of.pgcontainer -U postgres dbname` (use password `example` when prompted)
5. Connect to http://localhost:8002 and follow the TAO installation wizard
6. For the database hostname you should use `pgdb` as outlined in the docker-compose.yml
7. Use the `dbname` specified in your `createdb` 
8. Select the **Overwrite option**.

For the postgresql connection, the user is 'postgres' and
password is 'example' - you can change the password in the docker-compose.yml.


-----------------
