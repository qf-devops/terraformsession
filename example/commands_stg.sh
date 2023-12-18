
terraform init -backend-config=dev.conf

terraform plan -out=staging.plan -var-file=staging.tfvars

terraform apply staging.plan
