module "vpc" {
  source = "./modules/vpc"

  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  environment         = var.environment
}

module "securitygroup" {
  source = "./modules/securitygroup"
  vpc_id              = module.vpc.vpc_id
  runner_ssh_ip = var.runner_ssh_ip
  security_group_name = "meridian-sg"
  inbound_port        = 80
  ssh_port            = 22
  outbound_port       = 0
  https_port          = 443
  node_port = 3000
}

module "ec2" {
  source = "./modules/ec2"

instance_type = var.instance_type
  subnet_id              = module.vpc.public_subnet_ids[0]
  key_name               = var.key_name
  vpc_security_group_ids = [module.securitygroup.security_group_id]
  project_name = var.project_name
  environment            = "prod"

}

module "aws_ecr_repository" {
  source = "./modules/ecr"
  project_name = "meridian"
}

terraform {
  backend "s3" {
    bucket       = "meridian-terraform-state-92a7ed8e"
    key          = "global/s3/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}