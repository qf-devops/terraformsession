terraform {
  backend "s3" {
    bucket = "user34fdjghvjgcvsgvInfo"
    key    = "user34/dev/terraform.tfstate"
    region = "us-east-1"
  }
}