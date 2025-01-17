-- Deploy toudou:categories to pg

BEGIN;

-- data definition
create table api.categories (
    id bigint primary key generated always as identity,
    title varchar (50) not null,
    color varchar (7) not null check ( color ~* '^#[a-f0-9]{6}$') -- check for hex formatted colors
);

create table api.categories_todos (
    category_id bigint references api.categories(id) on delete restrict,
    todo_id bigint references api.todos(id) on delete cascade,
    primary key (category_id, todo_id)
);

-- permissions
grant all on api.categories to web_anon;
grant all on api.categories_todos to web_anon;

COMMIT;
