module "vpc"{
  source = "./vpc"
  tags = var.tags
}
# module "instances"{
#   source = "./ec2"
#   tags = var.tags
# }
# module "elb"{
#   source = "./elb"
#   tags = var.tags
# }
