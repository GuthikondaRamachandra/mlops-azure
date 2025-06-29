variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "westeurope"
}

variable "project_name" {
  description = "Base name for resources"
  type        = string
  default     = "mlops-azure"
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}


variable "environments" {
  description = "Environment names to create resources for"
  type        = list(string)
  default     = ["dev", "qa", "prod"]
}
