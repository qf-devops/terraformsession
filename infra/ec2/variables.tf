variable "region" {
  type    = string
  default = "us-east-1"
}
variable "ami_id" {
  type = map
  default = {
    us-east-1    = "ami-035b3c7efe6d061d5"
    us-east-2    = "ami-02ccb28830b645a41"
    eu-central-1 = "ami-9787h5h6nsn75gd33"
  }
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "user34"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = string
  default     = "instance"
}