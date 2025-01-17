#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create schema api;
    create role ${DB_ANON_ROLE} nologin;
    grant usage on schema ${DB_SCHEMA} to ${DB_ANON_ROLE};
    create role ${DB_PGRST_AUTHENTICATOR_ROLE} noinherit login password '${DB_PGRST_AUTHENTICATOR_PASS}';
    grant ${DB_ANON_ROLE} to ${DB_PGRST_AUTHENTICATOR_ROLE};
EOSQL
