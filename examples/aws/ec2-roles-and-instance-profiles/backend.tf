terraform {
    backend "s3" {
        bucket = "terraform-isuru-iac-examples"
        key    = "terraform/ec2-instance-profiles-1"
        region = "ap-southeast-1"
    }
}
