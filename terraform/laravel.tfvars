region = "eu-central-1"

vpc_cidr = "10.0.0.0/16"
azs      = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
elb_name = "laravel-elb"
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
vpc_name = "laravel-vpc"
enable_nat_gateway   = true
single_nat_gateway   = true
enable_dns_hostnames = true

public_subnet_tags = {}

private_subnet_tags = {
  "kubernetes.io/role/internal-elb" = 1
}
node_group_name = "laravel-node-group"
cluster_name            = "laravel-eks"
cluster_version         = "1.29"

node_group_instance_types = ["t3.medium"]
node_group_min_size       = 1
node_group_max_size       = 3
node_group_desired_size   = 2
ec2_instance_name = "laravel"
user_id = "905418387368"