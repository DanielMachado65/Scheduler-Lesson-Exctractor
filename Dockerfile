FROM elixir:1.14

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

COPY . .

RUN mix do deps.get, deps.compile

CMD ["mix", "phx.server"]
