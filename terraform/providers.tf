# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    
    local = {}
    
  }
  backend "s3" {
    bucket = "statebucketfordemo"
    key    = "statetf"
    region = "eu-central-1"
  }
  
  required_version = ">= 1.0.0"  # Specify the version of Terraform
}

provider "aws" {
  region = var.region  # Specify the AWS region, assuming 'region' is defined in variables.tf
}
provider "kubernetes" {
  host                   = aws_eks_cluster.my-cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.my-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.my-cluster.token
}