resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucketi231220203hfgfggggggg"

  tags = {
    Name        = "My bucket"
    Environment = "Prod"
  }
}
resource "aws_instance" "app_server" {
  count = 2
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "user34"
  security_groups = [aws_security_group.example.name]
  user_data = "${file("init.sh")}"
  tags = {
    Name = "count.index"
  }
}

resource "aws_security_group" "example" {
  name        = "example-security-group34"
  description = "Example security group for EC2 instance"
 
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
