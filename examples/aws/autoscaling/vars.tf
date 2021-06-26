variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "devkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "devkey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1      = "ami-13be557e"
    ap-southeast-1 = "ami-03a4a9b0b0197b758"
    eu-west-1      = "ami-844e0bf7"
  }
}

