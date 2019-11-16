init:
	@git submodule update --init --recursive

build:
	@hugo

watch: 
	@hugo server -D -w

publish:
	@./bin/publish_to_ghpages.sh

.PHONY: build watch publish
