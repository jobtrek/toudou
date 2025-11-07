# Toudou

> Toudou is an ultra-simple, ultra-light and ultra-insecure to-do list API.
> This must only serve for experimentation and dev purposes.

**v1.0.0** <!-- x-release-please-version -->

## Architecture

This repo consists of a compose file with 4 containers :

1. **pgsql**, a [PostgreSQL](https://www.postgresql.org/) database.
2. **on-startup-migration**, a container that run [sqitch](https://sqitch.org/) migrations on startup.
3. **postgrest**, that autogenerate a REST API automatically from the db
   with [PostgREST](https://docs.postgrest.org/en/v12/).
4. **swagger-ui**, serves the API documentation in a [swagger UI](https://swagger.io/tools/swagger-ui/) frontend.

## How to run

```shell
# Duplicate env file and adapt env var to fit your needs
cp .env.example .env

# Start the containers
docker compose up -d # For local dev
docker compose -f compose.yaml -f compose.prod.yaml up -d # for production use
```

- The database is available on port `5432`.
- The API is available on port `3000`.
- The swagger is available on port `8080`.

## Extend

You can easily create new migrations with sqitch to extend the database.
Feel free to create roles and grants to allow more advanced user authentication
scenarios, see [The Golden Key](https://docs.postgrest.org/en/v12/tutorials/tut1.html).
