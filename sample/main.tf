resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucketi231220203hfgfg"

  tags = {
    Name        = "My bucket"
    Environment = "Prod"
  }
}
resource "aws_instance" "app_server" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name = "user34"
  security_groups = ["launch-wizard-15"]
  user_data = <<EOF
   #!/bin/bash
   sudo apt update
   sudo apt install nginx -y
   sudo systemctl enable nginx
  EOF
  tags = {
    Name = "ExampleAppServerInstance"
  }
}