

resource "aws_instance" "app_server" {
  ami           = "ami-0759f51a90924c166"
  instance_type = "t2.micro"
  key_name      = "user34"
  tags = {
    Name = "ddblock"
  }
}