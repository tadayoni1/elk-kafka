provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "hawa-terraform"
    key    = "state/elk-kafka/hawa_backend_config"
    region = "us-west-2"
  }
}