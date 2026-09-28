# Full Cycle — Slides

Slides do minicurso **Full Cycle**, feitos com [Quarto](https://quarto.org) + [Reveal.js](https://revealjs.com), publicados via GitHub Pages.

## Estrutura

- `index.qmd` — página inicial com links para todas as aulas.
- `aulas/*.qmd` — um deck de slides por aula/módulo.
- `_quarto.yml` — configuração do projeto (formato, tema, etc).

## Adicionando uma nova aula

1. Crie um arquivo em `aulas/NN-nome-da-aula.qmd` seguindo o padrão dos decks existentes (ex. `aulas/01-docker-para-aplicacoes-web.qmd`).
2. Adicione um link para ele em `index.qmd`.

## Preview e build

Não precisa ter o Quarto instalado: os comandos abaixo rodam tudo dentro de um
container Docker (a imagem é construída automaticamente na primeira vez).

```bash
make preview   # http://localhost:4200, com live-reload
make render    # gera o site estático em _site/
make shell     # shell dentro do container, pra rodar outros comandos quarto
make clean     # remove _site/ e .quarto/
```

Se preferir ter o Quarto instalado localmente, os comandos equivalentes são
`quarto preview` e `quarto render`.

## Deploy

O push na branch `main` dispara o workflow `.github/workflows/publish.yml`, que renderiza o projeto e publica na branch `gh-pages`. No GitHub, em *Settings → Pages*, configure a fonte como a branch `gh-pages` (pasta raiz).
