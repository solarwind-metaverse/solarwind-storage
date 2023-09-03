# Use the official PostgreSQL image as the base image
FROM postgres:latest

# Build arguments
ARG PG_ADMIN_USER_PASSWORD
ARG PG_SLW_USER_PASSWORD
ARG PG_AUTH_USER_PASSWORD

# Set environment variables for PostgreSQL
ENV POSTGRES_DB solarwind
ENV POSTGRES_USER admin
ENV POSTGRES_PASSWORD ${PG_ADMIN_USER_PASSWORD}

RUN mkdir -p /etc/postgresql/ssl
# Copy the SSL certificate and key to a different location
COPY assets/certs/server.crt /etc/postgresql/ssl/server.crt
COPY assets/certs/server.key /etc/postgresql/ssl/server.key
RUN chown postgres:postgres /etc/postgresql/ssl/server.key
RUN chmod 600 /etc/postgresql/ssl/server.key

# Run PostgreSQL initialization script
COPY assets/init.sql /docker-entrypoint-initdb.d/

WORKDIR /scripts
COPY assets/scripts/configure.sh .
RUN chmod +x configure.sh
RUN /scripts/configure.sh PG_SLW_USER_PASSWORD "${PG_SLW_USER_PASSWORD}"
RUN /scripts/configure.sh PG_AUTH_USER_PASSWORD "${PG_AUTH_USER_PASSWORD}"

EXPOSE 5432


