all: install-deps lint-actions lint-specs

clean:
	rm -rf node_modules
	rm -rf .make*

install-deps: .make-deps

lint-actions: install-deps
	node_modules/.bin/yamllint .github/workflows/*

lint-specs: install-deps
	node_modules/.bin/swagger-cli validate v1/openapi.yaml

.make-deps:
	npm install yaml-lint && npm install
	touch .make-deps

trigger-docs-build:
ifndef HOOKURL
	$(error HOOKURL must be defined!)
endif
	curl -X POST -d {} ${HOOKURL}


.PHONY: install-deps lint-actions lint-specs trigger-docs-build