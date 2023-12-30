module "vpc"{
  source     = "git@github.com:terraform30122023/vpc.git"
  tags       = var.tags
}
module "instances"{
  source         = "git@github.com:terraform30122023/ec2.git"
  tags           = var.tags
  instance_type  = "t2.micro"
  vpc_id         = module.vpc.vpcid
  subnet_id1     = module.vpc.subnetid1
  subnet_id2     = module.vpc.subnetid2
}
module "elb"{
  source        = "git@github.com:terraform30122023/elb.git"
  tags          = var.tags
  subnet_id1    = module.vpc.subnetid1
  subnet_id2    = module.vpc.subnetid2
  securitygroup = module.instances.sg1
  vpc_id        = module.vpc.vpcid
  instance1     = module.instances.instance1
  instance2     = module.instances.instance2
}
