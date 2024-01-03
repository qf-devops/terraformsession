variable "ec2_instances"{
    type = map(object({
    image           = string
    keypair         = string
    type            = string
    tagname         = string
  }))
  description = "List of ec2 instances."
  default     = {}
}