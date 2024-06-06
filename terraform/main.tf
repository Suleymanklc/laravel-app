

module "eks" {
  source = "./modules/eks"

  region                   = var.region
  vpc_cidr                 = var.vpc_cidr
  azs                      = var.azs
  private_subnets          = var.private_subnets
  public_subnets           = var.public_subnets
  enable_nat_gateway       = var.enable_nat_gateway
  single_nat_gateway       = var.single_nat_gateway
  enable_dns_hostnames     = var.enable_dns_hostnames
  public_subnet_tags       = var.public_subnet_tags
  private_subnet_tags      = var.private_subnet_tags
  cluster_name             = var.cluster_name
  cluster_version          = var.cluster_version
  node_group_instance_types = var.node_group_instance_types
  node_group_min_size      = var.node_group_min_size
  node_group_max_size      = var.node_group_max_size
  node_group_desired_size  = var.node_group_desired_size
}

module "elb" {
  source = "./modules/elb"

  vpc_id            = module.eks.vpc_id
  availability_zones = var.availability_zones
  elb_name           = var.elb_name
  depends_on = [ module.eks ]
}