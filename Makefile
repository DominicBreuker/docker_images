PROJECT_DIR   = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))


PACKER_AMD64_DIR        = $(PROJECT_DIR)packer/amd64
PACKER_AMD64_VERSION   := 1.3.3
PACKER_AMD64_SHA256    := 2e3ea8f366d676d6572ead7e0c773158dfea0aed9c6a740c669d447bcb48d65f
PACKER_AMD64_IMAGE_NAME = local/packer

build-packer-amd64:
	docker build -f $(PACKER_AMD64_DIR)/Dockerfile \
		         -t $(PACKER_AMD64_IMAGE_NAME):latest \
				 -t $(PACKER_AMD64_IMAGE_NAME):$(PACKER_AMD64_VERSION) \
		         --build-arg PACKER_VERSION=$(PACKER_AMD64_VERSION) \
		         --build-arg PACKER_SHA256=$(PACKER_AMD64_SHA256) \
				 $(PACKER_AMD64_DIR)

PACKER_ARM_DIR        = $(PROJECT_DIR)packer/arm
PACKER_ARM_VERSION   := 1.3.3
PACKER_ARM_SHA256    := a937a5cb49f1b321dfe309c06590de40b0675b3afe16dda6c488ecedeba1e1c2
PACKER_ARM_IMAGE_NAME = local/packer

build-packer-arm:
	docker build -f $(PACKER_ARM_DIR)/Dockerfile \
		         -t $(PACKER_ARM_IMAGE_NAME):latest \
				 -t $(PACKER_ARM_IMAGE_NAME):$(PACKER_AMD64_VERSION) \
		         --build-arg PACKER_VERSION=$(PACKER_ARM_VERSION) \
		         --build-arg PACKER_SHA256=$(PACKER_ARM_SHA256) \
				 $(PACKER_ARM_DIR)
