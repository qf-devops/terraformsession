
output "sg1" {
  value = aws_security_group.elb_sg.id
}
output "instance1" {
  value = aws_instance.elb_instance_example1.id
}

output "instance2" {
  value = aws_instance.elb_instance_example2.id
}


