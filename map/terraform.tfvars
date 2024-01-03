ec2_instances = {
  one = {
    image           = "ami-0fc5d935ebf8bc3bc"
    keypair         = "user34"
    type            = "t2.micro"
    tagname         = "one" 
  },
  two = {
    image           = "ami-0fc5d935ebf8bc3bc"
    keypair         = "user34"
    type            = "t2.small"
    tagname         = "two"
  }
}