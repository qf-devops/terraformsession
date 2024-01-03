resource "aws_instance" "app_server" {
  for_each      = var.ec2_instances
  ami           = each.value.image
  instance_type = each.value.type
  key_name      = each.value.keypair
  dynamic "tags" {
    for_each = length(each.value.tagnames) > 0 ? [1] : []
    content {
        for_each = each.value.tagnames
        content {
          name = tags.value.tagname
          type = tags.value.tagval
        }
      }
  }
}