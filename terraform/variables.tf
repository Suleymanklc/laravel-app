variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = ""
}
variable "ecr_name" {
  description = "The name of the ecr"
  type        = string
  default     = "laravel-ecr"
}
variable "subject_alternative_names" {
  description = "The name of the ECS cluster"
  type        = string
}
variable "domain_name" {
  description = "The name of the ECS cluster"
  type        = string
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = ""
}

variable "task_cpu" {
  description = "The name of the VPC"
  type        = string
  default     = ""
}
variable "task_memory" {
  description = "The name of the VPC"
  type        = string
  default     = ""
}
variable "service_name" {
  description = "The name of the ecs name"
  type        = string
  default     = "ecs"
}
variable "task_family" {
  description = "The name of the task_family"
  type        = string
  default     = "laravel"
}




variable "alb_sg_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}
variable "region" {
  description = "The name of the Region"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  description = "Flag to enable NAT gateway"
  type        = bool
  default     = true
}

variable "enable_vpn_gateway" {
  description = "Flag to enable VPN gateway"
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "dev"
  }
}
