terraform {
  backend "s3" {
    bucket = "user34fdjghvjgcvsgv"
    key    = "user34/dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}