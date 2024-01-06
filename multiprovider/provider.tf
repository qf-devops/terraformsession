terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
#local dopcker host
# provider "docker" {
#   host = "unix:///var/run/docker.sock"
# }

# remote docker host
provider "docker" {
  host = "tcp://23.23.28.233:2375"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}