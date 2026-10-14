.PHONY: fmt validate plan apply destroy test

ENV ?= dev
WORKDIR = envs/$(ENV)

fmt:
	@echo "==> Formatting Terraform files..."
	terraform fmt -recursive

validate:
	@echo "==> Validating $(ENV) configuration..."
	cd $(WORKDIR) && terraform init -backend=false && terraform validate

plan:
	@echo "==> Running Terraform Plan for $(ENV)..."
	cd $(WORKDIR) && terraform init && terraform plan

apply:
	@echo "==> Applying Terraform configuration for $(ENV)..."
	cd $(WORKDIR) && terraform init && terraform apply

destroy:
	@echo "==> Destroying Terraform infrastructure for $(ENV)..."
	cd $(WORKDIR) && terraform init && terraform destroy
