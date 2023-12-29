output "vpcid" {
  value = aws_vpc.vpc_demo.id
}
output "subnetid1" {
  value = aws_subnet.public_1.id
}

output "subnetid2" {
  value = aws_subnet.public_2.id
}