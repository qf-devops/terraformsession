resource "aws_instance" "cluster" {
  count         = 1
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
    type        = "ssh"
    host = element(aws_instance.cluster[*].public_ip, 0)
    user        = "ubuntu"
    private_key = file("~/aug/user34.pem")
    timeout     = "2m"
  }
  
  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "bootstrap-cluster.sh ${join(" ",
      aws_instance.cluster[*].private_ip)}",
    ]
  }
}