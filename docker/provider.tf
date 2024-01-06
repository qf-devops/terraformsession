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