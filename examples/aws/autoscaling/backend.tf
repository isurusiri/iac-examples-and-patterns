terraform {
  backend "s3" {
    bucket = "terraform-isuru-iac-examples"
    key    = "terraform/autoscaling-1"
    region = "ap-southeast-1"
  }
}
