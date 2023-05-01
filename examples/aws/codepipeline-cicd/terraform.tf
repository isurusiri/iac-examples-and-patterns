provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-isuru-iac-examples"
    key    = "terraform/ec2-1"
    region = "ap-southeast-1"
  }
}
