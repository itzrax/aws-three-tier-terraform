# Security Evidence and Verification

## Purpose

This document records the security checks used to assess the three-tier AWS infrastructure.

## Checks to Perform

### 1. Terraform Validation

```bash
make fmt
make validate
```

Confirm that the Terraform configuration is formatted and valid.

### 2. Static Security Analysis

Run Checkov against the Terraform configuration and review any findings. Record the results after the scan; do not assume all checks pass.

### 3. Network Isolation

Verify that:
- The Application Load Balancer is the intended public entry point.
- ECS tasks do not have public IP addresses.
- The database is not publicly accessible.
- The database security group allows PostgreSQL traffic only from the application security group.
- The application security group allows application traffic only from the load balancer security group.

### 4. Secrets and Terraform State

Verify that:
- No credentials or secrets are hardcoded in tracked files.
- Sensitive Terraform state files are excluded from Git.
- Remote state storage has appropriate access controls, encryption, and versioning.

### 5. Deployment Evidence

Record the date, commands, results, and relevant screenshots for each completed verification.

## Current Status

Verification results have not yet been recorded in this document. Update this section only after running the checks and reviewing their results.
