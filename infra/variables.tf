variable "project_name" {
  description = "Base name for resources"
  type        = string
  default     = "mlops"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "environments" {
  description = "Deployment environments"
  type        = list(string)
  default     = ["dev", "qa", "prod"]
}
