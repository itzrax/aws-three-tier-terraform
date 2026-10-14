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

variable "data_subnet_ids" {
  type        = list(string)
  description = "Private data subnet IDs for RDS"
}

variable "ecs_tasks_sg_id" {
  type        = string
  description = "Security Group ID of the ECS tasks allowed to connect to RDS"
}

variable "db_name" {
  type        = string
  description = "Name of the initial PostgreSQL database"
  default     = "appdb"
}

variable "db_username" {
  type        = string
  description = "Master username for PostgreSQL"
  default     = "dbadmin"
}