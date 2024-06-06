# variables.tf

variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones for the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnets for the VPC"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnets for the VPC"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default     = {}
}
variable "vpc_id" {
  description = "The VPC ID where the ELB will be deployed."
  type        = string
}

variable "availability_zones" {
  description = "The list of availability zones."
  type        = list(string)
}

variable "elb_name" {
  description = "The name of the ELB."
  type        = string
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default     = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.29"
}

variable "node_group_instance_types" {
  description = "Instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_min_size" {
  description = "Minimum size of the EKS node group"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum size of the EKS node group"
  type        = number
  default     = 3
}

variable "node_group_desired_size" {
  description = "Desired size of the EKS node group"
  type        = number
  default     = 2
}
