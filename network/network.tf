resource "aws_vpc" "main" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "11.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

resource "aws_network_interface" "main" {
  subnet_id       = aws_subnet.main.id
  private_ips     = ["11.0.1.50"]
  security_groups = [aws_security_group.main.id]
}

resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "user34"
  #security_groups = [aws_security_group.example.name]
  #user_data = file("init.sh")
  network_interface {
    network_interface_id = aws_network_interface.main.id
    device_index         = 0
  }
  tags = {
    Name = "instancewithvpc"
  }
}

resource "aws_security_group" "main" {
  name        = "example-security-group34"
  description = "Example security group for EC2 instance"
  vpc_id      = aws_vpc.main.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.main.id
  domain   = "vpc"
}