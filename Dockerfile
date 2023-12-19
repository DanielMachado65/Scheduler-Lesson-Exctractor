# Define a imagem base
FROM elixir:latest

# Define o diretório de trabalho dentro da imagem
WORKDIR /app

# Instala hex e rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Copia os arquivos do seu projeto para a imagem
COPY . .

# Instala as dependências do projeto
RUN mix deps.get

# Compila o projeto
RUN mix do compile

# Define o comando para iniciar o servidor Phoenix
CMD ["mix", "phx.server"]
