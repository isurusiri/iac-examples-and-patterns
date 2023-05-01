# AWS Codebuild
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_projects"></a> [projects](#input\_projects) | A list of objects representing Codebuild project configurations. | <pre>list(object({<br>    name : string<br>    description : string<br>    build_timeout : number<br>    service_role : string<br>    badge_enabled : bool<br>    concurrent_build_limit : number<br>    encryption_key : string<br>    queued_timeout : number<br>    artifacts_name : string<br>    artifacts_type : string<br>    environment_compute_type : string<br>    environment_image : string<br>    environment_type : string<br>    environment_image_pull_credentials_type : string<br>    environment_variables : map(object({<br>      value : string<br>      type : string<br>    }))<br>    logs_config : map(object({<br>      cloudwatch_logs : map(object({<br>        status : string<br>        group_name : string<br>        stream_name : string<br>      }))<br>      s3_logs : map(object({<br>        status : string<br>        location : string<br>        encryption_disabled : bool<br>        bucket_owner_access : string<br>      }))<br>    }))<br>    source_type : string<br>    source_location : string<br>    source_git_clone_depth : number<br>    source_fetch_submodules : bool<br>    source_version : string<br>    tags : map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | List of ARNs of the Codebuild projects. |
| <a name="output_id"></a> [id](#output\_id) | List of IDs of the Codebuild projects. |
| <a name="output_name"></a> [name](#output\_name) | List of names of the Codebuild projects. |
<!-- END_TF_DOCS -->