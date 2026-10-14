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

variable "github_org_or_user" {
  type        = string
  description = "GitHub username or organization name"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name"
  default     = "aws-three-tier-terraform"
}