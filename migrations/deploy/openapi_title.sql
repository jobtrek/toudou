-- Deploy toudou:openapi_title to pg

BEGIN;

COMMENT ON SCHEMA api IS
$$Todo list API

A RESTful API generated with PostgREST and using PostgreSQL to manage todo list.$$;

COMMIT;
