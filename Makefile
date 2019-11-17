EDITOR := nvim
POSTS := $(wildcard content/posts/*.md)

.DEFAULT_GOAL := help

init: ## Initialize sub modules
	@git submodule update --init --recursive

build: ## Build hugo site
	@hugo

new: ## Add new post
	@if [ -z $(title) ]; then\
		echo "Usage:\n    make new title=<title>";\
		exit 1;\
	fi
	@hugo new "posts/$(shell date +%Y%m%d)-$(title).md" --editor "$(EDITOR)"

edit: ## Edit post
	$(eval selected := $(shell ls -d $(POSTS) | peco))
	@if [ -n "$(selected)" ]; then\
		$(EDITOR) $(selected);\
	fi

watch: ## Watch file changes and build
	@hugo server -D -w

publish: ## Publish to the production
	@./bin/publish_to_ghpages.sh

help: ## Display the help
	@echo "Usage:\n    make <command>"
	@echo ""
	@echo "Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: init build new edit watch publish help
