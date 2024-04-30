TF_ENGINE:=terraform
ifeq ($(TF_ENGINE), terraform)
	TF_BINARY:=terraform
else ifeq ($(TF_ENGINE), opentofu)
	TF_BINARY:=tofu
endif

BREW_PACKAGES := cosign tenv terraform-docs tflint checkov trivy pre-commit
CHOCOLATEY_PACKAGES := cosign tenv terraform-docs tflint trivy
APT_PACKAGES :=
APK_PACKAGES := cosign

INSTALLER_PATH := $(shell { command -v brew || command -v choco || command -v apt ; } 2>/dev/null)
INSTALLER := $(shell { basename $(INSTALLER_PATH) ; } 2>/dev/null)

CHECKOV_OPTS:=

# General
all:

chores: documentation formatting

test: test_documentation test_lint test_security test_validation test_formatting

#
# Install
#

install: install_$(INSTALLER)

install_brew:
	brew tap tofuutils/tap
	brew install $(BREW_PACKAGES)

install_choco:
	choco install $(CHOCOLATEY_PACKAGES)
	# checkov


#
# Testing Workspace Setup
#
.terraform:
	$(TF_BINARY) init -backend=false #ANNO This command creates the .terraform directory.


#
# Terraform Formatting
#

.PHONY: formatting
formatting:
	$(TF_BINARY) fmt -recursive .

.PHONY: test_formatting
test_formatting:
	$(TF_BINARY) fmt -check -recursive .


#
# Terraform Docs
#

.PHONY: documentation
documentation:
	terraform-docs -c .terraform-docs.yml .

.PHONY: test_documentation
test_documentation:
	terraform-docs -c .terraform-docs.yml --output-check .


#
# Linting
#

.PHONY: fix_tflint
fix_tflint:
	tflint --init
	tflint --fix

.PHONY: test_tflint
test_tflint:
	tflint --init
	tflint


#
# Security
#

.PHONY: test_security
test_security: test_checkov test_trivy

.PHONY: test_checkov
test_checkov:
	checkov  --directory . $(CHECKOV_OPTS)

.PHONY: test_trivy
test_trivy:
	trivy config .


#
# Testing
#

.PHONY: terratest
terratest:
	@echo "Not yet implemented."

.PHONY: terraform_test
terraform_test:
	@echo "Not yet implemented."

.PHONY: test_validation
test_validation: .terraform
	$(TF_BINARY) validate


#
# Local Tools
#

.PHONY: precommit_install
precommit_install:
	pre-commit install
