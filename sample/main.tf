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

  tags = {
    Name = "ExampleAppServerInstance"
  }
}