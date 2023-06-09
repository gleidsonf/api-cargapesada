# Api

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

We are almost there! The following steps are missing:

    $ cd api

Build the docker container:

    $ docker compose build app


Create the database:
    
    $ docker compose db ash
    $ psql -h db -U postgres
    (password: postgres)
    $ CREATE DATABASE cargapesada;

Then configure your database in config/dev.exs and run:

    $ docker compose run app ash
    $ mix ecto.create

Run the database migrations:

    $ mix ecto.migrate

Start your Phoenix app with:

    $ docker compose up app

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server

Run the IEx console with:

    $ iex -S mix

Visualize routes with:

    $ mix phx.routes

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Using phx.gen

The phx.gen.json command can be broken down as:

phx.gen.json [Context] [Schema Name] [plural schema name = db table name] [database field:data type]
