pushd hardware
terraform init

terraform apply -auto-approve -var-file="parameters/parameters.tfvars"
popd