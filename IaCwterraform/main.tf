provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "finalprojectbucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
}

module "subnet" {
  source  = "./modules/subnet"
  vpc_id  = module.vpc.vpc_id
}

module "security_group" {
  source    = "./modules/securityGroup"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.subnet.subnet_id
}

module "ec2" {
  source            = "./modules/ec2"
  ec2InstanceType   = "t3.mciro"
  subnetID          = module.subnet.subnet_id
  ec2SecurityGroup  = [module.security_group.security_group_id]
}

module "IGW" {
  source = "./modules/IGW"
  vpc_id = module.vpc.vpc_id
}

module "routeTable" {
  source = "./modules/routeTable"
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.IGW.internet_gateway_id
  subnet_id = module.subnet.subnet_id
  route_table_id = module.routeTable.route_table_id
}

module "sns" {
  source          = "./modules/sns"
  sns_topic_name  = "monitoring-notification"
}

module "cloudwatch_cpu_alarm" {
  source        = "./modules/cloudwatch"
  instance_id   = module.ec2.ec2_instance_id
  sns_topic_arn = module.sns.sns_arn
}