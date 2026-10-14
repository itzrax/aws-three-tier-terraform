variable "aws_region" {
  type        = string
  description = "AWS region for bootstrap resources"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Project identifier for tagging and naming"
  default     = "aws-three-tier"
}