variable "ec2type"{
    type = string
    description = "ec2 instance type"
}

variable "ec2tag"{
    type = string
    description = "ec2 instance tag"
    default = "devo"
}