variable "region" {
  description = "The AWS region to deploy to"
  type        = string
}
variable "vpc_name" {
  description = "The AWS region to deploy to"
  type        = string
}
variable "elb_name" {
  description = "elb_name"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
}

variable "node_group_min_size" {
  type = number
}
variable "private_subnets" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable or disable NAT Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Enable or disable single NAT Gateway"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable or disable DNS hostnames in the VPC"
  type        = bool
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default     = {}
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
variable "node_group_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "node_group_instance_types" {
  description = "The instance types for the node group"
  type        = list(string)
}



variable "node_group_max_size" {
  description = "The maximum size of the node group"
  type        = number
}

variable "node_group_desired_size" {
  description = "The desired size of the node group"
  type        = number
}
