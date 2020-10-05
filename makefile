TAG?=latest-dev
NAMESPACE?=gonryun
IMAGE?=node-rabbitmq-arm64
DOCKER_PASS?=""
DOCKER_USER?=""
.PHONY: buildpush

buildpush:
    docker run --privileged --rm tonistiigi/binfmt --install all
    docker buildx create --name builder --driver docker-container --use || exit 0
    docker buildx inspect --bootstrap
    docker buildx build --platform linux/amd64,linux/arm64 --tag $(NAMESPACE)/$(IMAGE):$(TAG) .
    echo "$(DOCKER_PASS)" | docker login -u "$(DOCKER_USER)" --password-stdin
    docker buildx build --push --platform linux/amd64,linux/arm64 --tag $(NAMESPACE)/$(IMAGE):$(TAG) .