variable "projects" {
  description = "A list of objects representing Codebuild project configurations."
  type = list(object({
    name : string
    description : string
    build_timeout : number
    service_role : string
    badge_enabled : bool
    concurrent_build_limit : number
    encryption_key : string
    queued_timeout : number
    artifacts_name : string
    artifacts_type : string
    environment_compute_type : string
    environment_image : string
    environment_type : string
    environment_image_pull_credentials_type : string
    environment_variables : map(object({
      value : string
      type : string
    }))
    logs_config : map(object({
      cloudwatch_logs : map(object({
        status : string
        group_name : string
        stream_name : string
      }))
      s3_logs : map(object({
        status : string
        location : string
        encryption_disabled : bool
        bucket_owner_access : string
      }))
    }))
    source_type : string
    source_location : string
    source_git_clone_depth : number
    source_fetch_submodules : bool
    source_version : string
    tags : map(string)
  }))
}
