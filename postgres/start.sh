#!/bin/bash

source .env
docker rm --force slw-postgres
echo "PGDATA_DIR: $PGDATA_DIR"
mkdir -p $PGDATA_DIR
docker run -d -p 5432:5432 --name slw-postgres \
  -v $PGDATA_DIR:/var/lib/postgresql/data \
  vhalme/slw-postgres:x86_1 \
  -c ssl=on \
  -c ssl_cert_file=/etc/postgresql/ssl/server.crt \
  -c ssl_key_file=/etc/postgresql/ssl/server.key