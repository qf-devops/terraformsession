
variable "instance_names" {
  default = ["instance-1", "instance-2", "instance-3"]
}
 
resource "aws_instance" "example" {
  for_each = { for idx, name in var.instance_names : name => idx }
 
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = each.key
  }
}

resource "aws_instance" "example" {
  for_each = { for i in range(1, 11) : "instance-${i}" }
 
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = each.key
  }
}