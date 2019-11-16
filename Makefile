EDITOR := nvim
POSTS := $(wildcard content/posts/*.md)

init:
	@git submodule update --init --recursive

build:
	@hugo

edit:
	$(eval selected := $(shell ls -d $(POSTS) | peco))
	@if [ -n "$(selected)" ]; then\
		$(EDITOR) $(selected);\
	fi

watch: 
	@hugo server -D -w

publish:
	@./bin/publish_to_ghpages.sh

.PHONY: init build edit watch publish
