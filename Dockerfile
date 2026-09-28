# Imagem com o Quarto CLI, para renderizar/pré-visualizar os slides sem
# precisar instalar nada na máquina host. O projeto é montado como volume
# em tempo de execução (veja o Makefile) — esta imagem só traz a ferramenta.
FROM debian:bookworm-slim

ARG QUARTO_VERSION=1.10.18

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && curl -fsSL -o /tmp/quarto.deb \
       "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" \
    && apt-get install -y /tmp/quarto.deb \
    && rm -f /tmp/quarto.deb \
    && apt-get purge -y curl \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# HOME gravável por qualquer UID, para rodar o container com --user
# apontando pro usuário do host e não gerar arquivos de cache como root.
ENV HOME=/tmp

WORKDIR /project

ENTRYPOINT ["quarto"]
CMD ["--help"]
