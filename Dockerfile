FROM elixir:1.10.3

RUN mkdir app/
COPY . /app

WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix do compile