pushd hardware
terraform init

terraform apply -var-file="parameters/parameters.tfvars"
popd