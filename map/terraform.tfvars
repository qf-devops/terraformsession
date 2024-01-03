ec2_instances = {
  one = {
    image           = "ami-0fc5d935ebf8bc3bc"
    keypair         = "user34"
    type            = "t2.micro"
    tagnames         = ["demo1", "Demo11"]
  },
  two = {
    image           = "ami-0fc5d935ebf8bc3bc"
    keypair         = "user34"
    type            = "t2.small"
    tagnames         = ["demo2", "demo22"]
  }
}