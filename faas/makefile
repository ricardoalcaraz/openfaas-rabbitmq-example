FAAS_PASS?=dotnet-multiarch-test
FAAS_GATEWAY?="http://gateway.openfaas:8080/"
HEARTBEAT_SCHEDULE?="*/5 * * * *"
PARALLELISM=5
.PHONY: build

build:
	faas-cli build -f functions.yml

push:
	faas-cli push -f functions.yml --parallel $(PARALLELISM)

deploy:
	echo "$(FAAS_PASS)" | faas-cli login --password-stdin --gateway="$(FAAS_GATEWAY)"
	faas-cli deploy -f functions.yml --gateway="$(FAAS_GATEWAY)"