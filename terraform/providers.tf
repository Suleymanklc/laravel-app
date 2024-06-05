# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    local = {}
  }

  backend "http" {
    address        = "https://api.tfstate.dev/github/v1"
    lock_address   = "https://api.tfstate.dev/github/v1/lock"
    unlock_address = "https://api.tfstate.dev/github/v1/lock"
    lock_method    = "PUT"
    unlock_method  = "DELETE"
    username       = "Suleymanklc/laravel-app"
  }
  
  required_version = ">= 1.0.0"  # Specify the version of Terraform
}

provider "aws" {
  region = var.region  # Specify the AWS region, assuming 'region' is defined in variables.tf
}
