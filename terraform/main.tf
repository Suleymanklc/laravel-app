
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "network" {
  source = "./modules/network"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-west-2a", "us-west-2b"]
  internet_gateway_id = module.vpc.internet_gateway_id
}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.network.public_subnets
  private_subnets = module.network.private_subnets
  security_group_id = module.network.security_group_id
}
