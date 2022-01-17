module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"
  version = "~> 3.0"

  name = "atlantis"

  # VPC
  cidr            = "10.20.0.0/16"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  public_subnets  = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]

  # DNS (without trailing dot)
  route53_zone_name = var.ROUTE53_ZONE_NAME

  # ACM (SSL certificate) - Specify ARN of an existing certificate or new one will be created and validated using Route53 DNS
  certificate_arn = var.CERTIFICATE_ARN

  # Atlantis
  atlantis_github_user       = var.ATLANTIS_GITHUB_USER
  atlantis_github_user_token = var.ATLANTIS_GITHUB_TOKEN
  atlantis_repo_allowlist    = var.ATLANTIS_REPO_ALLOWLIST

  custom_environment_variables = [
    {
      "name" : "ATLANTIS_REPO_CONFIG_JSON",
      "value" : jsonencode(yamldecode(file("${path.module}/server-config.yaml"))),
    },
  ]
}