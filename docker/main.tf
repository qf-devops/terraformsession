resource "docker_container" "n1" {
  name  = "n1"
  image = docker_image.nginx.image_id
  ports = [80]
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}