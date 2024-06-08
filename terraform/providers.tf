# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
     kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
    local = {}
    
  }
  backend "s3" {
    bucket = "statebucketformytf"
    key    = "env:/demo/tf-states"
    region = "eu-central-1"
    shared_credentials_file = "~/.aws/credentials"
  }

  required_version = ">= 1.0.0"  
}

provider "aws" {
  region = var.region  
}
