terraform init -backend-config=dev.conf
terraform plan -out=dev.plan -var-file=dev.tfvars 
terraform apply dev.plan