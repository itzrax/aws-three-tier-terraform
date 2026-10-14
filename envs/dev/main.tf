module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = "10.0.0.0/16"
}

output "vpc_id" {
  value       = module.network.vpc_id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = module.network.public_subnet_ids
  description = "Public Subnet IDs"
}

output "app_subnet_ids" {
  value       = module.network.app_subnet_ids
  description = "App Subnet IDs"
}

output "data_subnet_ids" {
  value       = module.network.data_subnet_ids
  description = "Data Subnet IDs"
}

module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = "10.0.0.0/16"
}

module "compute" {
  source = "../../modules/compute"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  app_subnet_ids    = module.network.app_subnet_ids
  container_port    = 5000
}

output "vpc_id" {
  value       = module.network.vpc_id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = module.network.public_subnet_ids
  description = "Public Subnet IDs"
}

output "app_subnet_ids" {
  value       = module.network.app_subnet_ids
  description = "App Subnet IDs"
}

output "data_subnet_ids" {
  value       = module.network.data_subnet_ids
  description = "Data Subnet IDs"
}

output "alb_dns_name" {
  value       = module.compute.alb_dns_name
  description = "Public ALB DNS Name"
}

output "ecr_repository_url" {
  value       = module.compute.ecr_repository_url
  description = "ECR Repository URL"
}