resource "aws_instance" "app_server" {
  for_each      = var.ec2_instances
  ami           = each.value.image
  instance_type = each.value.type
  key_name      = each.value.keypair
  dynamic "tags" {
    for_each = each.value.tagnames
     content {
          key   = tags.value.tagname
          value = tags.value.tagval
        }
  }
}