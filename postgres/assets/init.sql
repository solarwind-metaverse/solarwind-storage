-- Create the "slw_user" with full access rights to the "solarwind" database
CREATE USER slw_user WITH PASSWORD '${PG_SLW_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON DATABASE solarwind TO slw_user;
GRANT USAGE ON SCHEMA public TO slw_user;
CREATE USER auth_user WITH PASSWORD '${PG_AUTH_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON DATABASE solarwind TO auth_user;
GRANT USAGE ON SCHEMA public TO auth_user;
GRANT CREATE ON SCHEMA public TO auth_user;
CREATE EXTENSION "pgcrypto";


