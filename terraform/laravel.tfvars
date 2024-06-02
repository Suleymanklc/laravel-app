vpc_name = "laravel-private-vpc"
vpc_cidr = "10.0.0.0/16"
availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
enable_nat_gateway = true
enable_vpn_gateway = true
vpc_tags = {
  Terraform = "true"
  Environment = "dev"
}

cluster_name          = "laravel-ecs-cluster"
task_family           = "laravel-ecs-task"
task_cpu              = "256"
task_memory           = "512"
container_definitions = jsonencode([{
  name      = "nginx"
  image     = "nginx"
  essential = true
  portMappings = [{
    containerPort = 80
    hostPort      = 80
  }]

alb_name              = "my-alb"
alb_security_group_id = "<replace-with-alb-security-group-id>"
alb_listener_http_port = 80
alb_listener_https_port = 443


ecs_cluster_name      = "my-ecs-cluster"
ecs_task_family       = "my-ecs-task"
ecs_task_cpu          = "256"
ecs_task_memory       = "512"
ecs_service_name      = "my-ecs-service"
ecs_desired_count     = 1

# Domain for Self-Signed Certificate
domain_name = "example.com"
