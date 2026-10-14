# Architecture Overview

## Project Goal

Build a three-tier AWS application using Terraform, with separate network layers for public entry, application processing, and database storage.

## Network Design

- **VPC:** Custom network using `10.0.0.0/16`.
- **Public subnets:** Intended to host the Application Load Balancer and NAT Gateway.
- **Private application subnets:** Intended to run containerized Flask application tasks using Amazon ECS Fargate.
- **Private database subnets:** Intended to host Amazon RDS for PostgreSQL without direct public access.

## Traffic Flow

1. Internet users send requests to the Application Load Balancer.
2. The load balancer forwards requests to the application tasks.
3. The application connects to PostgreSQL to retrieve or store data.

## Security Boundaries

- Application tasks should accept traffic only from the load balancer's security group.
- The database should accept PostgreSQL traffic only from the application security group.
- Database resources should not be publicly accessible.
- IAM permissions should follow the principle of least privilege.

## Infrastructure Management

Terraform defines the infrastructure as code. The project separates bootstrap resources from the main infrastructure configuration.

## Implementation Status

This document describes the intended architecture. Actual deployment and security controls must be verified against the Terraform configuration and test results before being marked complete.
