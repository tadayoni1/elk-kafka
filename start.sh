pushd hardware
terraform init -backend-config="key=state/elk-kafka/hawa_backend_config"

terraform apply -auto-approve -var-file="parameters.tfvars"
popd