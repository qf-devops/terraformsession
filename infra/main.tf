module "vpc"{
  source = "./vpc"
  tags = var.tags
}
module "instances"{
  source = "./ec2"
  tags = var.tags
  instance_type = "t2.micro"
  vpc_id = module.vpc.vpcid
  subnet_id1 = module.vpc.subnetid1
  subnet_id2 = module.vpc.subnetid2
}
# module "elb"{
#   source = "./elb"
#   tags = var.tags
# }
