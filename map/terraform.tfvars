ec2_instances = {
  one = {
    image           = "ami-0fc5d935ebf8bc3bc"
    keypair         = "user34"
    type            = "t2.micro"
    tagnames         = {
         tags  =  {
             tag1   = {
                    "tagname" = "Name",
                    "tagval"  = "demo1"
                  },
             tag2   = {
                    "tagname" = "env",
                    "tagval"  = "stage"
                  }
         }
    }
  },
  two = {
    image           = "ami-0fc5d935ebf8bc3bc"
    keypair         = "user34"
    type            = "t2.small"
    tagnames         = {
        tags = {
                tag1   = {
                    "tagname" = "Name",
                    "tagval"  = "demo2"
                },
                tag2   = {
                    "tagname" = "env",
                    "tagval"  = "dev"
                }
        }
    }
  }
}