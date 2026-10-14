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