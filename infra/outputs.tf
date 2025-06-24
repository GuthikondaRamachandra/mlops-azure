output "resource_group_name" {
  value = azurerm_resource_group.mlops_rg.name
}

output "key_vault_dev" {
  value = azurerm_key_vault.dev.name
}

output "key_vault_qa" {
  value = azurerm_key_vault.qa.name
}

output "key_vault_prod" {
  value = azurerm_key_vault.prod.name
}

