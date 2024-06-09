variable "cluster_name" {
  description = "Name of the EKS Cluster."
}

variable "cluster_version" {
  description = "Version of the EKS Kubernetes cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC id used to build the eks cluster"
  type = string
}

variable "public_subnets" {
  description = "public subnets"
}

variable "private_subnets" {
  description = "private subnets"
}

variable "region" {
  description = "AWS region."
}



variable "user_id" {
  description = "AWS account id"
}