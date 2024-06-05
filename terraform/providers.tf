# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    local = {}
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "personaldemo-space0001"

    workspaces {
      name = "demo"
    }
  }
  required_version = ">= 1.0.0"  # Specify the version of Terraform
}

provider "aws" {
  region = var.region  # Specify the AWS region, assuming 'region' is defined in variables.tf
}
