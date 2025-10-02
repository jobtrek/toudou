-- Revert toudou:openapi_title from pg

BEGIN;

COMMENT ON SCHEMA api IS NULL;

COMMIT;
