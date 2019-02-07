NAMESPACE?=spotinst
IMAGE?=spotinst-aks-engine-tools
IMAGE_REPOSITORY?=registry.hub.docker.com
IMAGE_TAG?=latest

.PHONY: image imagepush

all: image

image:
	docker build \
		--pull \
		-t $(IMAGE) \
		-t $(IMAGE_REPOSITORY)/$(NAMESPACE)/$(IMAGE):$(IMAGE_TAG) \
		.

imagepush:
	docker push $(IMAGE_REPOSITORY)/$(NAMESPACE)/$(IMAGE):$(IMAGE_TAG)
