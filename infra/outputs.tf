output "resource_groups" {
  value = { for env in var.environments : env => azurerm_resource_group.mlops_env[env].name }
}

output "key_vaults" {
  value = { for env in var.environments : env => azurerm_key_vault.mlops_env_kv[env].name }
}

output "databricks_urls" {
  value = { for env in var.environments : env => azurerm_databricks_workspace.mlops_env_ws[env].workspace_url }
}
