terraform {
  backend "s3" {
    bucket = "terraform-isuru-iac-examples"
    key    = "terraform/vpc-nacl-1"
    region = "ap-southeast-1"
  }
}
