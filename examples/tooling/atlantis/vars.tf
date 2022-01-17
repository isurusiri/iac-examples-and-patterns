variable "ROUTE53_ZONE_NAME" {
    default = "example.com"
    type    = string
}

variable "CERTIFICATE_ARN" {
    type = string
}

variable "ATLANTIS_GITHUB_USER" {
    default = "atlantis-bot"
    type    = string
}

variable "ATLANTIS_GITHUB_TOKEN" {
    type = string
}

variable "ATLANTIS_REPO_ALLOWLIST" {
    default = ["github.com/isurusiri/*"]
    type    = list(string)
}
