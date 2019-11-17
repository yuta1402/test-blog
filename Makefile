EDITOR := nvim
POSTS := $(wildcard content/posts/*.md)

init:
	@git submodule update --init --recursive

build:
	@hugo

new:
	@if [ -z $(title) ]; then\
		echo "Usage:\n\tmake new title=<title>";\
		exit 1;\
	fi
	@hugo new "posts/$(shell date +%Y%m%d)-$(title).md"

edit:
	$(eval selected := $(shell ls -d $(POSTS) | peco))
	@if [ -n "$(selected)" ]; then\
		$(EDITOR) $(selected);\
	fi

watch: 
	@hugo server -D -w

publish:
	@./bin/publish_to_ghpages.sh

.PHONY: init build new edit watch publish
