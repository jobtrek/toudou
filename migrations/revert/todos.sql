-- Revert toudou:todos from pg

BEGIN;

-- permissions
revoke usage on schema api from web_anon;
revoke all on api.todos from web_anon;

-- data definition
drop table api.todos;

COMMIT;
