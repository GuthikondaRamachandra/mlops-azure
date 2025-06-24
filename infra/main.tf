terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}
provider "azurerm" {
  features {}
}


resource "azurerm_databricks_workspace" "mlops_env_ws" {
  for_each = toset(var.environments)

  name                = "databricks-${var.project_name}-${each.key}"
  location            = var.location
  resource_group_name = azurerm_resource_group.mlops_env[each.key].name
  sku                 = "premium"
}
