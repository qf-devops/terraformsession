resource "docker_container" "ubuntu" {
  name  = "foo"
  image = docker_image.ubuntu.image_id
}

resource "docker_image" "ubuntu" {
  name = "ubuntu:precise"
}