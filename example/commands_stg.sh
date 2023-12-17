terraform plan -out=staging.plan -var-file=staging.tfvars -state=staging.tfstate
terraform apply -state=staging.tfstate staging.plan
