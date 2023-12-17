terraform plan -out=dev.plan -var-file=dev.tfvars -state=dev.tfsttae
terraform apply -state=dev.tfstate dev.plan

terraform plan -out=staging.plan -var-file=staging.tfvars -state=staging.tfstate
terraform apply -state=staging.tfstate staging.plan
