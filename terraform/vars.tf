variable "helm_repository" {
  description = "The Helm repository to use."
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace to deploy the Harness delegate to."
  type        = string
  default     = "harness-delegate-ng"
}

variable "delegate_image" {
  description = "The image of delegate."
  type        = string
  default     = "harness/delegate:22.11.77611"
}

variable "delegate_name" {
  description = "The name of the Harness delegate."
  type        = string
  // default     = "harness-delegate"
}

variable "account_id" {
  description = "The account ID to use for the Harness delegate."
  type        = string
}

variable "delegate_token" {
  description = "The account secret to use for the Harness delegate."
  type        = string
  // sensitive = true
}

variable "manager_endpoint" {
  description = "The endpoint of Harness Manager."
  type        = string
  // default     = "https://app.harness.io/gratis"
}

variable "proxy_user" {
  description = "The proxy user to use for the Harness delegate."
  type        = string
  // sensitive = true
  default = ""
}

variable "proxy_password" {
  description = "The proxy password to use for the Harness delegate."
  type        = string
  // sensitive = true
  default = ""
}

variable "irsa_enabled" {
  description = "Whether to enable IRSA for the Harness delegate."
  type        = bool
  default     = false
}

variable "irsa_role_arn" {
  description = "The ARN of the role to use for IRSA for the Harness delegate."
  type        = string
  default     = ""
}

variable "values" {
  description = "Additional values to pass to the helm chart. Values will be merged, in order, as Helm does with multiple -f options"
  type        = string
  default     = ""
}
