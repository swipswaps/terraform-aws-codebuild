# Artifacts
variable "artifacts" {
  description = "Information about the project's build output artifacts."
  type        = map
}

variable "artifacts_type" {
  description = "The build output artifact's type. Valid values for this parameter are: `CODEPIPELINE`, `NO_ARTIFACTS` or `S3`."
  type        = string
  default     = "NO_ARTIFACTS"
}

variable "artifacts_artifact_identifier" {
  description = "The artifact identifier. Must be the same specified inside AWS CodeBuild buildspec."
  type        = string
  default     = null
}

variable "artifacts_encryption_disabled" {
  description = "If set to true, output artifacts will not be encrypted. If `type` is set to `NO_ARTIFACTS` then this value will be ignored."
  type        = bool
  default     = false
}

variable "artifacts_override_artifact_name" {
  description = "If set to true, a name specified in the build spec file overrides the artifact name."
  type        = bool
  default     = true
}

variable "artifacts_location" {
  description = "Information about the build output artifact location. If `type` is set to `CODEPIPELINE` or `NO_ARTIFACTS` then this value will be ignored. If `type` is set to `S3`, this is the name of the output bucket."
  type        = string
  default     = null
}

variable "artifacts_name" {
  description = "The name of the project. If `type` is set to `S3`, this is the name of the output artifact object."
  type        = string
  default     = null
}

variable "artifacts_namespace_type" {
  description = "The namespace to use in storing build artifacts. If `type` is set to `S3`, then valid values for this parameter are: `BUILD_ID` or `NONE`."
  type        = string
  default     = null
}

variable "artifacts_packaging" {
  description = "The type of build output artifact to create. If `type` is set to `S3`, valid values for this parameter are: `NONE` or `ZIP`"
  type        = string
  default     = null
}

variable "artifacts_path" {
  description = "If `type` is set to `S3`, this is the path to the output artifact"
  type        = string
  default     = ""
}

# Cache
variable "cache" {
  description = "Information about the cache storage for the project."
  type        = map
}

variable "cache_type" {
  description = "The type of storage that will be used for the AWS CodeBuild project cache. Valid values: `NO_CACHE`, `LOCAL`, and `S3`."
  type        = string
  default     = "NO_CACHE"
}

variable "cache_location" {
  description = "The location where the AWS CodeBuild project stores cached resources. For type S3 the value must be a valid S3 bucket name/prefix. (Required when cache `type` is `S3`)"
  type        = string
  default     = null
}

variable "cache_modes" {
  description = "Specifies settings that AWS CodeBuild uses to store and reuse build dependencies. Valid values: `LOCAL_SOURCE_CACHE`, `LOCAL_DOCKER_LAYER_CACHE`, and `LOCAL_CUSTOM_CACHE`. (Required when cache type is `LOCAL`)"
  type        = string
  default     = []
}

# Environment
variable "environment" {
  description = "Information about the project's build environment."
  type        = map
}

variable "environment_computer_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

variable "environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/standard:2.0"
}

variable "environment_type" {
  description = "The type of build environment to use for related builds. Available values are: `LINUX_CONTAINER`, `LINUX_GPU_CONTAINER`, `WINDOWS_CONTAINER` or `ARM_CONTAINER`."
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "environment_image_pull_credentials_type" {
  description = "The type of credentials AWS CodeBuild uses to pull images in your build. Available values for this parameter are `CODEBUID` or `SERVICE_ROLE`. When you use a cross-account or private registry image, you must use SERVICE_ROLE credentials. When you use an AWS CodeBuild curated image, you must use CODEBUILD credentials."
  type        = string
  default     = "CODEBUILD"
}

variable "environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list
  default     = []
}

variable "environment_privileged_mode" {
  description = "If set to true, enables running the Docker daemon inside a Docker container."
  type        = bool
  default     = false
}

variable "environment_certificate" {
  description = "The ARN of the S3 bucket, path prefix and object key that contains the PEM-encoded certificate."
  type        = string
  default     = null
}

variable "environment_registry_credential" {
  description = "Information about credentials for access to a private Docker registry. Registry Credential config blocks are documented below."
  type        = map
  default     = null
}

# Logs
variable "cloudwatch_logs" {
  description = "Configuration for the builds to store log data to CloudWatch."
  type        = map
  default     = null
}

variable "cloudwatch_logs_status" {
  description = "Current status of logs in CloudWatch Logs for a build project. Valid values: `ENABLED`, `DISABLED."
  type        = string
  default     = "ENABLED"
}

variable "group_name" {
  description = "The group name of the logs in CloudWatch Logs."
  type        = string
  default     = null
}

variable "stream_name" {
  description = "The stream name of the logs in CloudWatch Logs."
  type        = string
  default     = null
}

variable "s3_logs" {
  description = "Configuration for the builds to store log data to S3."
  type        = map
  default     = null
}

variable "s3_logs_status" {
  description = "Current status of logs in S3 for a build project. Valid values: `ENABLED`, `DISABLED."
  type        = string
  default     = "DISABLED"
}

variable "s3_logs_location" {
  description = "The name of the S3 bucket and the path prefix for S3 logs. Must be set if status is ENABLED, otherwise it must be empty."
  type        = string
  default     = null
}

variable "s3_logs_encryption_disabled" {
  description = "Set to true if you do not want S3 logs encrypted."
  type        = string
  default     = true
}

# Source
variable "source" {
  description = "Information about the project's input source code."
  type        = map
}

variable "source_type" {
  description = "The type of repository that contains the source code to be built. Valid values for this parameter are: `CODECOMMIT`, `CODEPIPELINE`, `GITHUB`, `GITHUB_ENTERPRISE`, `BITBUCKET`, `S3` or `NO_SOURCE`."
  type        = string
  default     = "GITHUB"
}

variable "source_buildspec" {
  description = "The build spec declaration to use for this build project's related builds. This must be set when type is iNO_SOURCE`"
  type        = string
  default     = null
}


variable "source_git_clone_depth" {
  description = "Information about the Git submodules configuration for an AWS CodeBuild build project. Git submodules config blocks are documented below. This option is only valid when the type is `CODECOMMIT`."
  type        = number
  default     = 1
}

variable "source_insecure_ssl" {
  description = "Ignore SSL warnings when connecting to source control."
  type        = bool
  default     = false
}

variable "source_location" {
  description = "The location of the source code from git or s3."
  type        = string
  default     = null
}

variable "source_report_build_status" {
  description = "Set to true to report the status of a build's start and finish to your source provider. This option is only valid when the type is `BITBUCKET` or `GITHUB`."
  type        = bool
  default     = true
}


variable "source_auth_type" {
  description = "The authorization type to use. The only valid value is OAUTH"
  type        = string
  default     = "OAUTH"
}

variable "source_auth_resource" {
  description = "The resource value that applies to the specified authorization type."
  type        = string
  default     = null
}

variable "source_git_submodules_config_fetch_submodules" {
  description = "If set to true, fetches Git submodules for the AWS CodeBuild build project."
  type        = bool
  default     = true
}


# General vars
variable "name" {
  description = "The projects name."
  type        = string
}

variable "source" {
  description = "Information about the project's input source code."
  type        = map
}

variable "badge_enabled" {
  description = "Generates a publicly-accessible URL for the projects build badge. Available as badge_url attribute when enabled."
  type        = bool
  default     = false
}

variable "build_timeout" {
  description = "How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed.The default is 60 minutes."
  type        = number
  default     = 60
}

variable "queued_timeout" {
  description = "How long in minutes, from 5 to 480 (8 hours), a build is allowed to be queued before it times out.The default is 8 hours."
  type        = number
  default     = 480
}

variable "cache" {
  description = "Information about the cache storage for the project."
  type        = map
}

variable "description" {
  description = "A short description of the project."
  type        = string
  default     = null
}

variable "encryption_key" {
  description = "The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build project's build output artifacts."
  type        = string
  default     = null
}

variable "cloudwatch_logs" {
  description = "Configuration for the builds to store log data to CloudWatch."
  type        = map
  default     = null
}

variable "s3_logs" {
  description = "Configuration for the builds to store log data to S3."
  type        = map
  default     = null
}
