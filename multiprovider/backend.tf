terraform {
  backend "s3" {
    bucket = "user34fdjghvjgcvsgv"
    key    = "user34/eks/terraform.tfstate"
    region = "us-east-1"
  }
}