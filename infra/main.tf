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

resource "azurerm_resource_group" "mlops_env" {
  for_each = toset(var.environments)

  name     = "rg-${var.project_name}-${each.key}"
  location = var.location
}

resource "azurerm_key_vault" "mlops_env_kv" {
  for_each = toset(var.environments)

  name                        = "kv-${var.project_name}-${each.key}"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.mlops_env[each.key].name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
}


