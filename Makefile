# Setup local bin directory to ensure deterministic tests using the correct tool version.
BIN           := $(PWD)/.local/bin
CACHE         := $(PWD)/.local/cache
PATH          := $(BIN):$(PATH)
SHELL         := env PATH=$(PATH) /bin/sh

# Versions
terraform_version      := 1.5.0
terraform_docs_version := 0.19.0

# Operating System
os ?= $(shell uname | tr A-Z a-z)

# CPU Architecture
ifeq ($(shell uname -m),arm64)
  arch ?= arm64
else
  arch ?= amd64
endif

.PHONY: all
all: format lint install docs test

.PHONY: tools
tools: $(BIN)/terraform

terraform_package_name := terraform_$(terraform_version)_$(os)_$(arch).zip
terraform_package_url  := https://releases.hashicorp.com/terraform/$(terraform_version)/$(terraform_package_name)
terraform_binary_name  := $(BIN)/terraform-$(terraform_version)-$(os)-$(arch)

$(BIN)/terraform:
	@mkdir -p $(BIN)
	@echo "Downloading Terraform $(terraform_version) to $(terraform_install_path)..."
	@curl --silent --show-error --fail --create-dirs --output-dir $(BIN) -O -L $(terraform_package_url)
	@unzip -d $(BIN) $(BIN)/$(terraform_package_name) && rm $(BIN)/$(terraform_package_name)
	@mv $(BIN)/terraform $(terraform_binary_name)
	@ln -s $(terraform_binary_name) $(BIN)/terraform

.PHONY: init 
init: $(BIN)/terraform
	@echo "Updating dependencies..."

.PHONY: build
build: update
	@echo "Building..."

.PHONY: format
format: tools
	@echo "Formatting..."

.PHONY: lint
lint: tools
	@echo "Linting..."

.PHONY: docs
docs: tools
	@echo "Generating Docs..."

.PHONY: test
test: install
	@echo "Testing..."

.PHONY: clean
clean:
	@echo "Removing the $(CACHE) directory..."
	@rm -rf $(CACHE)
	@echo "Removing the $(BIN) directory..."
	@rm -rf $(BIN)
	@rm -rf $(PWD)/.local
