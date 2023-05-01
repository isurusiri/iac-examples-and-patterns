resource "aws_codebuild_project" "main" {

  count = length(var.projects)

  name          = var.projects[count.index].name
  description   = var.projects[count.index].description
  build_timeout = var.projects[count.index].build_timeout
  service_role  = var.projects[count.index].service_role

  badge_enabled          = var.projects[count.index].badge_enabled
  concurrent_build_limit = var.projects[count.index].concurrent_build_limit
  encryption_key         = var.projects[count.index].encryption_key
  queued_timeout         = var.projects[count.index].queued_timeout

  artifacts {
    name = var.projects[count.index].artifacts_name
    type = var.projects[count.index].artifacts_type
  }

  environment {
    compute_type                = var.projects[count.index].environment_compute_type
    image                       = var.projects[count.index].environment_image
    type                        = var.projects[count.index].environment_type
    image_pull_credentials_type = var.projects[count.index].environment_image_pull_credentials_type

    dynamic "environment_variable" {
      for_each = can(var.projects[count.index].environment_variables) ? var.projects[count.index].environment_variables : {}

      content {
        name  = environment_variable.key
        value = environment_variable.value.value
        type  = environment_variable.value.type
      }
    }
  }

  dynamic "logs_config" {
    for_each = can(var.projects[count.index].logs_config) ? var.projects[count.index].logs_config : {}

    content {
      dynamic "cloudwatch_logs" {
        for_each = can(logs_config.value.cloudwatch_logs) ? logs_config.value.cloudwatch_logs : {}

        content {
          status      = cloudwatch_logs.value.status
          group_name  = cloudwatch_logs.value.group_name
          stream_name = cloudwatch_logs.value.stream_name
        }
      }

      dynamic "s3_logs" {
        for_each = can(logs_config.value.s3_logs) ? logs_config.value.s3_logs : {}

        content {
          status              = s3_logs.value.status
          location            = s3_logs.value.location
          encryption_disabled = s3_logs.value.encryption_disabled
          bucket_owner_access = s3_logs.value.bucket_owner_access
        }
      }
    }
  }

  source {
    type            = var.projects[count.index].source_type
    location        = var.projects[count.index].source_location
    git_clone_depth = var.projects[count.index].source_git_clone_depth

    git_submodules_config {
      fetch_submodules = var.projects[count.index].source_fetch_submodules
    }
  }

  source_version = var.projects[count.index].source_version

  tags = var.projects[count.index].tags
}
