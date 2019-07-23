provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "hawa-terraform"
    region = "us-west-2"
  }
}