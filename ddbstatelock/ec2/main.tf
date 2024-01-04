terraform {
  backend "s3" {
    bucket = "user34fdjghvjgcvsgv"
    key    = "user34/dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0759f51a90924c166"
  instance_type = "t2.micro"
  key_name      = "user34"
  tags = {
    Name = ddblock
  }
}