READ_ENV = $(shell cat .env)
CF_PORT=8000

# TODO: make the local port configurable
.PHONY: start-dev-tunnel
start-dev-tunnel:
	ngrok http $(CF_PORT)

.PHONY: start-local
start-local: .env
	env $(READ_ENV) mix run --no-halt 

.PHONY: test
test:
	mix test


.PHONY: deps
deps:
	mix deps.get

.env: .env.example
	cp .env.example .env