

module "eks" {
  source = "./modules/eks"
  cluster_name           = var.cluster_name
  cluster_version        = var.cluster_version
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = module.vpc.private_subnets
  node_group_name        = var.node_group_name
  node_group_instance_types = var.node_group_instance_types
  node_group_min_size    = var.node_group_min_size
  node_group_max_size    = var.node_group_max_size
  node_group_desired_size = var.node_group_desired_size
}


module "vpc" {
source = "./modules/vpc"
  
  vpc_name = "laravel-vpc"
  vpc_cidr = var.vpc_cidr
  azs  = var.azs

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
}




module "elb" {
  source = "./modules/elb"
  
  elb_name          = var.elb_name
  availability_zones = var.azs
  instance_ids      = module.eks.node_group_ids["default"]
}
