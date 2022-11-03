module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./ec2"

  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.private_subnets
}
