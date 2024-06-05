# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    local = {}
  }
    backend "s3" {
    bucket         	   = "tfstate"
    key              	   = "state/terraform.tfstate"
    region         	   = "eu-central-1"
    encrypt        	   = true
    dynamodb_table = "mycomponents_tf_lockid"
  }
  required_version = ">= 1.0.0"  # Specify the version of Terraform
}

provider "aws" {
  region = var.region  # Specify the AWS region, assuming 'region' is defined in variables.tf
}
