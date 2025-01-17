-- Deploy toudou:todos to pg

BEGIN;

-- data definition
create table api.todos (
    id bigint primary key generated always as identity,
    title varchar (250) not null,
    content text,
    due_date date,
    done boolean default false
);

-- permissions
grant usage on schema api to web_anon;
grant all on api.todos to web_anon;

COMMIT;
