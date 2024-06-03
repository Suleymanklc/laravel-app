module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.availability_zones
  private_subnets    = var.private_subnet_cidrs
  public_subnets     = var.public_subnet_cidrs
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  tags               = var.vpc_tags

}

module "ecs" {
  source = "./modules/ecs"

  cluster_name          = var.cluster_name
  task_family           = var.task_family
  task_cpu              = var.task_cpu
  task_memory           = var.task_memory
    container_definitions = jsonencode([{
    name      = "my-container"
    image     = "nginx"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
  service_name   = var.service_name
  desired_count  = 1
  subnets        = module.vpc.private_subnets
  vpc_id         = module.vpc.vpc_id
}
module "security_group" {
  source = "./modules/sg"

  alb_sg_name = var.alb_sg_name
  vpc_id      = module.vpc.vpc_id
}
module "cert" {
  source = "./modules/cert"
  
}
module "alb" {
  source = "./modules/alb"
  aws_lb_name              = "laravel-alb"
  aws_lb_target_group_name = "laravel-alb-target"
  security_group_id = module.security_group.alb_sg_id
  subnets           = module.vpc.public_subnets
  vpc_id            = module.vpc.vpc_id
  target_group_port = 80
  listener_http_port = 80
  listener_https_port = 443
  domain_name = var.domain_name 
  certificate_arn = module.cert.arn
  depends_on = [ module.cert ]
}

module "ecr" {

  source = "./modules/ecr"
  ecr_name = var.ecr_name
  
}