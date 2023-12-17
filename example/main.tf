resource "tls_private_key" "oskey" {
  algorithm = "RSA"
}
 
resource "local_file" "myterrakey" {
  content  = tls_private_key.oskey.private_key_pem
  filename = "user34v1.pem"
}
 
resource "aws_key_pair" "key121" {
  key_name   = "user34v1"
  public_key = tls_private_key.oskey.public_key_openssh
}


resource "aws_instance" "app_server" {
  ami           = "ami-0759f51a90924c166"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key121.key_name
  tags = {
    Name = "User34_test"
  }
}
