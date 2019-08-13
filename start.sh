while getopts e:i:r:m: option
do
case "${option}"
in
m) TERRAFORM_MODE=${OPTARG};;
esac
done

if [ -z $TERRAFORM_MODE ]; then
  # by default it runs 'terraform apply'. With -m you can run 'terraform plan' or 'terraform destroy'
  TERRAFORM_MODE="apply"
fi

pushd hardware
terraform init

terraform ${TERRAFORM_MODE} -auto-approve -var-file="parameters/parameters.tfvars"
popd
