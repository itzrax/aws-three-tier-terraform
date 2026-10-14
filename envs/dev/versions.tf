terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Configured after Phase 1 bootstrap bucket creation
  backend "s3" {
    # Replace bucket with your actual S3 state bucket name from bootstrap phase
    bucket       = "aws-three-tier-tfstate-xxxx"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "aws-three-tier"
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}