variable "ec2type"{
    type = string
    description = "ec2 instance type"
}

variable "ec2tag"{
    type = string
    description = "ec2 instance tag"
    default = "devo"
}

variable "ec2keyname"{
    type = string
    description = "ec2 key"
}
variable "instanceslist"{
    type = list
    description = "ec2 insytances list"
}
