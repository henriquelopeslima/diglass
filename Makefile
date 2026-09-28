IMAGE   := diglass-quarto
PORT    := 4200
DOCKER  := docker run --rm \
	--user $(shell id -u):$(shell id -g) \
	-e HOME=/tmp \
	-v $(CURDIR):/project

.PHONY: build preview render shell clean

build: ## Constrói a imagem Docker com o Quarto CLI
	docker build -t $(IMAGE) .

preview: build ## Sobe o preview com live-reload em http://localhost:$(PORT)
	$(DOCKER) -it -p $(PORT):$(PORT) $(IMAGE) preview --host 0.0.0.0 --port $(PORT) --no-browser

render: build ## Renderiza o site estático em _site/
	$(DOCKER) $(IMAGE) render

shell: build ## Abre um shell dentro do container (debug/comandos avulsos do quarto)
	$(DOCKER) -it --entrypoint bash $(IMAGE)

clean: ## Remove os artefatos de build locais
	rm -rf _site .quarto
