# Full Cycle — Slides

Slides do minicurso **Full Cycle**, feitos com [Quarto](https://quarto.org) + [Reveal.js](https://revealjs.com), publicados via GitHub Pages.

## Estrutura

- `index.qmd` — página inicial com links para todas as aulas.
- `aulas/*.qmd` — um deck de slides por aula/módulo.
- `_quarto.yml` — configuração do projeto (formato, tema, etc).

## Adicionando uma nova aula

1. Crie um arquivo em `aulas/NN-nome-da-aula.qmd` seguindo o padrão do `aulas/01-introducao.qmd`.
2. Adicione um link para ele em `index.qmd`.

## Preview local

```bash
quarto preview
```

## Build

```bash
quarto render
```

Os arquivos gerados vão para `_site/` (ignorado pelo git).

## Deploy

O push na branch `main` dispara o workflow `.github/workflows/publish.yml`, que renderiza o projeto e publica na branch `gh-pages`. No GitHub, em *Settings → Pages*, configure a fonte como a branch `gh-pages` (pasta raiz).
