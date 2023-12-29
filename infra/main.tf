module "vpc"{
  source = "./vpc"
  tags = var.tags
}
module "instances"{
  source = "./ec2"
  tags = var.tags
  instance_type = "t2.micro"
  vpc_id = module.vpc.vpc_id
  subnet_id1 = module.vpc.subnet_id
  subnet_id2 = module.vpc.subnet_id
}
# module "elb"{
#   source = "./elb"
#   tags = var.tags
# }
