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

resource "aws_network_interface" "test" {
  subnet_id       = aws_subnet.public_a.id
  private_ips     = ["11.0.1.50"]
  security_groups = [aws_security_group.web.id]

  attachment {
    instance     = aws_instance.main.id
    device_index = 1
  }
}

resource "aws_instance" "main" {
  count = 2
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "user34"
  #security_groups = [aws_security_group.example.name]
  #user_data = file("init.sh")
  tags = {
    Name = "instancewithvpc"
  }
}