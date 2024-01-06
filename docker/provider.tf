terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# provider "docker" {
#   host = "unix:///var/run/docker.sock"
# }

provider "docker" {
  host     = "ssh://ubuntu@23.23.28.233:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
  cert_path = pathexpand(".docker")
  #key_material  = file(pathexpand(".docker/user34.pem"))
}