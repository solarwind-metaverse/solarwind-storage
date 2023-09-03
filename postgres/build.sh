#!/bin/bash

source .env
docker rmi --force vhalme/slw-postgres:x86_1
docker buildx build --platform=linux/x86_64 \
  --build-arg PG_ADMIN_USER_PASSWORD=$PG_ADMIN_USER_PASSWORD \
  --build-arg PG_SLW_USER_PASSWORD=$PG_SLW_USER_PASSWORD \
  --build-arg PG_AUTH_USER_PASSWORD=$PG_AUTH_USER_PASSWORD \
  -t vhalme/slw-postgres:x86_1 . --no-cache