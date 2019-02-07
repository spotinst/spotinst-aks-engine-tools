NAMESPACE?=spotinst
IMAGE?=spotinst-aks-engine-tools
IMAGE_TAG?=latest

.PHONY: image imagepush

all: image

image:
	docker build \
		--pull \
		-t $(IMAGE) \
		-t $(NAMESPACE)/$(IMAGE):$(IMAGE_TAG) \
		.

imagepush:
	docker push $(NAMESPACE)/$(IMAGE):$(IMAGE_TAG)
