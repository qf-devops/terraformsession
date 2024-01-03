variable "ec2_instances"{
    type = map(object({
    image           = string
    keypair         = string
    type            = string
    tagnames        = object({
      tags = map(object({
        tagname = string
        tagval = string
      }))
    })
  }))
  description = "List of ec2 instances."
  default     = {}
}