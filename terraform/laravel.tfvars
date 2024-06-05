vpc_name = "laravel-private-vpc"
ecr_name = "laravel-acr"
vpc_cidr = "10.0.0.0/16"
availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
enable_nat_gateway = true
enable_vpn_gateway = false
vpc_tags = {
  Terraform = "true"
  Environment = "dev"
}
cluster_name          = "laravel-ecs-cluster"
task_cpu              = "256"
task_memory           = "512"
service_name = "laravel"
db_name = "laravel"
db_password=  "laravel"
db_root_password = "laravel"
db_user= "laravel"


