-- Deploy toudou:openapi_title to pg

BEGIN;

-- XXX Add DDLs here.
COMMENT ON SCHEMA api IS
$$Todo list API

A RESTful API generated with PostggREST and using PostgreSQL to manage todo list.$$;

COMMIT;
