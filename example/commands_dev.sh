terraform plan -out=dev.plan -var-file=dev.tfvars -state=dev.tfsttae
terraform apply -state=dev.tfstate dev.plan