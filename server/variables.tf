variable "cloud_service_provider" {
  type        = string
  description = "Cloud Service Provider: azure or google"

  validation {
    condition     = contains(["azure", "google"], var.cloud_service_provider)
    error_message = "Valid values for var: cloud_service_provider are (azure, google)."
  }
}

variable "ssh_username" {
  type        = string
  description = "username of SSH to the compute engine"
}

variable "ssh_public_key" {
  type        = string
  description = "Public key for SSH"
}

variable "google_project" {
  type        = string
  default     = "no project"
  description = "Google Cloud Project Name."
}

locals {
  # cross variables validation could be improved in Terraform v1.9.0
  # tflint-ignore: terraform_unused_declarations
  validate_project = (var.google_project == "no project" && var.cloud_service_provider == "google") ? tobool(
  "google_project must be provided when the provider is 'google'.") : true
}