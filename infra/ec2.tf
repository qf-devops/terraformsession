resource "aws_instance" "cluster" {
  count         = 3
  ami           = lookup(var.ami_id, var.region)
  instance_type = "t2.micro"
  key_name      = "user34"
}

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    cluster_instance_ids = join(",", aws_instance.cluster[*].id)
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = element(aws_instance.cluster[*].public_ip, 0)
  }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "echo 'hello'>/tmp/abc ${join(" ",
      aws_instance.cluster[*].private_ip)}",
    ]
  }
}