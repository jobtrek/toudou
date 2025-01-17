-- Revert toudou:categories from pg

BEGIN;

-- permissions
revoke all on api.categories_todos from web_anon;
revoke all on api.categories from web_anon;

-- data definition
drop table api.categories_todos;
drop table api.categories;

COMMIT;
