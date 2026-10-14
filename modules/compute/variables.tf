variable "project_name" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment identifier"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for the ALB"
}

variable "app_subnet_ids" {
  type        = list(string)
  description = "Private app subnet IDs for ECS tasks"
}

variable "container_port" {
  type        = number
  description = "Port exposed by the image"
  default     = 5000
}