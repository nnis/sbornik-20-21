.DEFAULT_GOAL := pdf
OUTPUT = IP-sbornik-20-21
SRC := $(wildcard src/*.md)
TITLE := ./img/titulka-20-21.pdf

TEMPOUT := temp

.PHONY: pdf clean help

pdf: ## Vyrobi pdf
	@mkdir -p build

	pandoc \
	--pdf-engine=xelatex \
	--template=./templates/eisvogel.latex \
	--toc \
	--toc-depth=2 \
	--number-sections \
	--top-level-division=chapter \
	--filter pandoc-crossref \
	-o build/$(TEMPOUT).pdf \
	src/config.yaml $(SRC)

	pdftk ${TITLE} build/$(TEMPOUT).pdf cat output build/$(OUTPUT).pdf
	@rm -f build/$(TEMPOUT).pdf

epub: ## Vyrobi epub
	@mkdir -p build

	pandoc \
	--css ./templates/epub.css \
	--toc \
	--toc-depth=2 \
	--number-sections \
	--top-level-division=chapter \
	--filter pandoc-crossref \
	-o build/$(OUTPUT).epub \
	src/config.yaml $(SRC)

clean: ## Vsechno vycisti
	rm -rf ./build

help: ## Tahle napoveda
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
