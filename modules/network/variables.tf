variable "project_name" {
  type        = string
  description = "Project name used for tagging resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., dev, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private application subnets"
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "data_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private data subnets"
  default     = ["10.0.20.0/24", "10.0.21.0/24"]
}