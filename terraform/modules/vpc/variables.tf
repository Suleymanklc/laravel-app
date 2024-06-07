variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}
variable "vpc_name" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "laravel-vpc"
}

variable "azs" {
  description = "A list of availability zones in the region."
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "private_subnets" {
  description = "A list of private subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "public_subnet_tags" {
  description = "Tags to assign to the public subnets."
  type        = map(string)
  default     = {
    Name = "Public Subnet"
  }
}

variable "private_subnet_tags" {
  description = "Tags to assign to the private subnets."
  type        = map(string)
  default     = {
    Name = "Private Subnet"
    "kubernetes.io/role/internal-elb" = 1
  }
}
