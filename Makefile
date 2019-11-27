all: install-deps lint-actions lint-specs

clean:
	rm -rf node_modules
	rm -rf .make*

install-deps: .make-deps

lint-actions: install-deps
	yamllint .github/workflows/*

lint-specs: install-deps
	node_modules/.bin/swagger-cli validate v1/api.yaml

.make-deps:
	npm install yaml-lint && npm install
	touch .make-deps


.PHONY: install-deps lint-actions lint-specs