# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    
    local = {}
    
  }
  backend "s3" {
    bucket = "statebucketformytf"
    key    = "tf-states"
    region = "eu-central-1"
    shared_credentials_file = "~/.aws/credentials"
  }

  required_version = ">= 1.0.0"  # Specify the version of Terraform
}

provider "aws" {
  region = var.region  # Specify the AWS region, assuming 'region' is defined in variables.tf
}
